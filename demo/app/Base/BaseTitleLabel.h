//
//  BaseTitleLabel.h
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BaseTitleLabelDelegate <NSObject>
- (void)textDidSet:(NSString *)text;
@end

@interface BaseTitleLabel : UILabel
@property (weak, nonatomic) id <BaseTitleLabelDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
