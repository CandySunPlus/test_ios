//
//  BackgroundView.m
//  test
//
//  Created by NikSun on 2018/12/16.
//  Copyright © 2018 NikSun. All rights reserved.
//

#import "BackgroundView.h"
#import "GradientButton.h"
#import <Masonry/Masonry.h>

@interface BackgroundView()
@property (nonatomic, strong) GradientButton* button;
- (void)setupCAGradientLayer;
@end

@implementation BackgroundView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        [self setupCAGradientLayer];
        _button = ({
            GradientButton *button = [GradientButton buttonWithType:UIButtonTypeSystem];
            [button setTitle:@"测试按钮" forState:UIControlStateNormal];
            [button setGradientWithDeg:0 startColor:[UIColor colorWithRed:1.00 green:0.29 blue:0.49 alpha:1.0] endColor:[UIColor colorWithRed:1.00 green:0.38 blue:0.00 alpha:1.0]];
            button.backgroundColor = [UIColor redColor];
            button;
        });
        [self addSubview:_button];
    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(92);
        make.right.equalTo(self).with.offset(-92);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(46);
    }];
    [super updateConstraints];
}

+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (void)setupCAGradientLayer {
    UIColor *colorOne = [UIColor colorWithRed:(120/255.0) green:(135/255.0) blue:(150/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(57/255.0)  green:(79/255.0)  blue:(96/255.0)  alpha:1.0];
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    CAGradientLayer *layer = (CAGradientLayer *)self.layer;
    layer.colors = colors;
    layer.locations = locations;
}


@end
