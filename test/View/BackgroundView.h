//
//  BackgroundView.h
//  test
//
//  Created by NikSun on 2018/12/16.
//  Copyright © 2018 NikSun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ButtonProtocolName;

@interface BackgroundView : UIView
@property (nonatomic, weak) id <ButtonProtocolName> delegate;
@end

@protocol ButtonProtocolName
- (void)buttonWasPressed;
@end

NS_ASSUME_NONNULL_END
