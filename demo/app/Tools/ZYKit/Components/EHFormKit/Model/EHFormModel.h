//
//  EHFormModel.h
//  ExpandHouseProject
//
//  Created by 张祎 on 2018/1/11.
//  Copyright © 2018年 张祎. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EHFormModel : NSObject

/// 标题/索引
@property (strong, nonatomic) NSString *name;
/// 值
@property (strong, nonatomic) NSString *value;
/// 提交名
@property (strong, nonatomic) NSString *submitName;
/// 提交值
@property (strong, nonatomic) NSString *submitValue;
/// 附加模型 - 有时候需要传一个model过去
@property (strong, nonatomic) id model;
/// ext容器 - 储存更多的数据
@property (strong, nonatomic, readonly) NSMutableDictionary *ext;
/// 线高度
@property (assign, nonatomic) CGFloat separatorHeight;
/// 线颜色
@property (strong, nonatomic) UIColor *separatorColor;
/// 线偏移
@property (assign, nonatomic) CGFloat separatorOffset;
/// 行高
@property (assign, nonatomic) CGFloat rowHeight;
/// 背景颜色 空行类型可以用
@property (strong, nonatomic) UIColor *backgroundColor;
/// 表单cell
@property (strong, nonatomic) NSString *cell;
/// 是否为空白行
@property (assign, nonatomic) BOOL isWhiteRow;
/// 是否可点击
@property (assign, nonatomic) BOOL canTap;
/// 是否可选中
@property (assign, nonatomic) BOOL canSelected;
/// 是否可交互
@property (assign, nonatomic) BOOL userInteractionEnabled;
/// 开关是否打开 - 仅在EHFormTypeSwitch有效
@property (assign, nonatomic) BOOL on;
/// 是否使用xib
@property (assign, nonatomic) BOOL useXib;
/// 是否改变过
@property (assign, nonatomic) BOOL isChanged;
/// 事件回调 无论什么事件 均可以通过该方法回调
@property (copy, nonatomic) void (^callBack) (EHFormModel *);
/// 富文本placeHolder
@property (strong, nonatomic) NSAttributedString *attributedPlaceHolder;
/// 扩展属性补充
- (void)eh_attributed:(void (^) (EHFormModel *model))attributed;

@end
