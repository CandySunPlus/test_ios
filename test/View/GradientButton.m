//
//  GradientButton.m
//  test
//
//  Created by NikSun on 2018/12/16.
//  Copyright © 2018 NikSun. All rights reserved.
//

#import "GradientButton.h"
@interface GradientButton()
@property (nonatomic, strong) CAGradientLayer* gradientLayer;
@end

@implementation GradientButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.gradientLayer = [[CAGradientLayer alloc] init];
    }
    return self;
}

- (void)setGradientWithDeg:(float)deg startColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    self.gradientLayer.frame = self.bounds;
    self.gradientLayer.colors = @[(id)startColor.CGColor, (id)endColor.CGColor];
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    [self.layer insertSublayer:self.gradientLayer atIndex:0];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}
@end
