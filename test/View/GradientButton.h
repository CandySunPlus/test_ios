//
//  GradientButton.h
//  test
//
//  Created by NikSun on 2018/12/16.
//  Copyright © 2018 NikSun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GradientButton : UIButton
- (void)setGradientWithDeg:(float) deg startColor:(UIColor *)startColor endColor:(UIColor *)endColor;
- (void)applySketchShadow:(UIColor *)color alpha:(float)alpha x:(CGFloat)x y:(CGFloat)y blur:(CGFloat)blur spread:(CGFloat)spread;
- (void)setCornerRadius:(CGFloat)cornerRadius;
@end

NS_ASSUME_NONNULL_END
