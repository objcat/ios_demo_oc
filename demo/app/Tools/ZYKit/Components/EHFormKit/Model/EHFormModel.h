//
//  EHFormModel.h
//  ExpandHouseProject
//
//  Created by 张祎 on 2018/1/11.
//  Copyright © 2018年 张祎. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class EHFormTableView;

typedef NS_ENUM(NSUInteger, EHFormModelEventType) {
    /// 普通点击cell
    EHFormModelEventTypeCell,
    /// 按钮点击
    EHFormModelEventTypeButtonTouchUpInside,
    /// 文本框结束
    EHFormModelEventTextFieldShouldEndEditing,
    /// 图片点击
    EHFormModelEventTypeImageViewTouchUpInside,
    /// 照相机点击
    EHFormModelEventTypeCameraTouchUpInside,
    /// 删除图片
    EHFormModelEventTypeDeleteImage,
    /// 单选框点击
    EHFormModelEventTypeRadioChoose,
    /// 开关点击
    EHFormModelEventTypeSwitch,
};

@interface EHFormModel : NSObject
/// model里面装tableView
@property (weak, nonatomic) EHFormTableView *tableView;
/// ID (用于唯一确定model, 初始值为name)
@property (strong, nonatomic) NSString *ID;
#warning name一般不进行更改, 如果非要更改name请务必在eh_attributed中设置ID为原来的name 否则一旦外部使用该name进行取值 则会出现重大Bug
/// 标题/索引
@property (strong, nonatomic) NSString *name;
/// 值
@property (strong, nonatomic) NSString *value;
/// 占位文字
@property (strong, nonatomic) NSString *placeHolder;
/// 提交名
@property (strong, nonatomic) NSString *submitName;
/// 提交值
@property (strong, nonatomic) NSString *submitValue;
/// 附加模型 - 有时候需要传一个model过去
@property (strong, nonatomic) id model;
/// ext容器 - 储存更多的数据
@property (strong, nonatomic, readonly) NSMutableDictionary *ext;
///  数组容器 - 储存更多的数据
@property (strong, nonatomic) NSMutableArray *arr;
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
/// cell类型
@property (strong, nonatomic) Class cellClass;
/// 重用池名 默认为cell名 但是可以单独设置 目的可以给同一种类cell装进不同重用池
@property (strong, nonatomic) NSString *reuseId;
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
@property (copy, nonatomic) void (^callBack) (EHFormModel *, EHFormModelEventType, NSDictionary *);
/// 点击事件类型
@property (assign, nonatomic) EHFormModelEventType eventType;
/// 富文本placeHolder
@property (strong, nonatomic) NSAttributedString *attributedPlaceHolder;
/// 扩展属性补充
- (void)eh_attributed:(void (^) (EHFormModel *attributed))attributed;
/// 自用属性 是否被选中
@property (assign, nonatomic) BOOL selected;

@end
