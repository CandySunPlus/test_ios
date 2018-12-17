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
@end

@implementation BackgroundView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _button = ({
            GradientButton *button = [GradientButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"首次登录送￥5" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setGradientWithDeg:70 startColor: [UIColor colorWithRed:1.00 green:0.38 blue:0.00 alpha:1.0] endColor:[UIColor colorWithRed:1.00 green:0.29 blue:0.49 alpha:1.0]];
            [button applySketchShadow:[UIColor colorWithRed:253/255.0f green:85/255.0f blue:30/255.0f alpha:1.0] alpha:1.0f x:0.0f y:6.0f blur:17.0f spread:-7.0f];
            [button setCornerRadius:5];
            [button.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
            [button setImage:[UIImage imageNamed:@"wechat"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"wechat"] forState:UIControlStateHighlighted];
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

@end
