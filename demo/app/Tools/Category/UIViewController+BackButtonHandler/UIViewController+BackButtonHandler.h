//
//  UIViewController+BackButtonHandler.h
//  demo
//
//  Created by 张祎 on 2020/6/5
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol <NSObject>
@optional
- (BOOL)navigationShouldPopOnBackButton;
@end

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (BackButtonHandler) <BackButtonHandlerProtocol>

@end

NS_ASSUME_NONNULL_END
