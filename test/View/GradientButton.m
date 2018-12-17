//
//  GradientButton.m
//  test
//
//  Created by NikSun on 2018/12/16.
//  Copyright © 2018 NikSun. All rights reserved.
//

#import "GradientButton.h"
@interface GradientButton()
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) CALayer *shadowLayer;
@property (nonatomic, copy) void (^spreadShadow)(void);
@end

@implementation GradientButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.gradientLayer = [[CAGradientLayer alloc] init];
        self.shadowLayer = [[CALayer alloc] init];
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    }
    return self;
}

- (void)setGradientWithDeg:(float)deg startColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    self.gradientLayer.frame = self.bounds;
    self.gradientLayer.masksToBounds = YES;
    self.gradientLayer.colors = @[(id)startColor.CGColor, (id)endColor.CGColor];
    float x = deg / 360.0f;
    CGPoint startPoint = CGPointMake(
            powf(sinf((float) (2 * M_PI * ((x + 0.75) / 2))), 2),
            powf(sinf((float) (2 * M_PI * ((x + 0) / 2))), 2)
    );
    CGPoint endPoint = CGPointMake(
            powf(sinf((float) (2 * M_PI * ((x + 0.25) / 2))), 2),
            powf(sinf((float) (2 * M_PI * ((x + 0.5) / 2))), 2)
    );
    self.gradientLayer.startPoint = startPoint;
    self.gradientLayer.endPoint = endPoint;
    [self.layer insertSublayer:self.gradientLayer atIndex:1];
}

- (void)applySketchShadow:(UIColor *)color alpha:(float)alpha x:(CGFloat)x y:(CGFloat)y blur:(CGFloat)blur spread:(CGFloat)spread {
    self.shadowLayer.backgroundColor = [UIColor whiteColor].CGColor;
    self.shadowLayer.shadowColor = color.CGColor;
    self.shadowLayer.shadowOpacity = alpha;
    self.shadowLayer.shadowOffset = CGSizeMake(x, y);
    self.shadowLayer.shadowRadius = blur;
    self.shadowLayer.masksToBounds = NO;
    if (spread) {
        __block CGFloat _spread = spread;
        __weak __typeof(self) weakSelf = self;
        self.spreadShadow = ^(void) {
            CGRect rect = CGRectInset(weakSelf.bounds, -_spread, -_spread);
            CGPathRef shadowPathRef = [UIBezierPath bezierPathWithRect:rect].CGPath;
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            strongSelf.shadowLayer.shadowPath = shadowPathRef;
            strongSelf.shadowLayer.shadowRadius = blur + _spread;
        };
    }
    [self.layer insertSublayer:self.shadowLayer atIndex:0];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.shadowLayer.cornerRadius = cornerRadius;
    self.gradientLayer.cornerRadius = cornerRadius;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
    self.shadowLayer.frame = self.bounds;
    if (self.spreadShadow) {
        self.spreadShadow();
    }
    [self bringSubviewToFront:self.imageView];
}
@end
