//
//  EHFormTableView.h
//  ExpandHouse
//
//  Created by 张祎 on 2018/9/12.
//  Copyright © 2018年 objcat. All rights reserved.
//  https://github.com/objcat/EHFormKit

#import <UIKit/UIKit.h>
#import "EHFormModel.h"
#import "EHTapTableViewCell.h"
#import "EHWhiteRowTableViewCell.h"

@protocol EHFormTableViewDelegate <NSObject>
@optional
/// 滚动代理方法 可以自己进行扩展
- (void)eh_scrollViewDidScroll:(UIScrollView *)scrollView;
@end

/// 快速构建表单工具
@interface EHFormTableView : UITableView

/// 初始化方法, 默认frame是CGRectZero
+ (instancetype)tableView;

/// 删除所有cell
- (void)removeAllCells;

/// 数据源
@property (strong, nonatomic, readonly) NSMutableArray *sourceArray;
/// 索引数组
@property (strong, nonatomic, readonly) NSMutableArray *indexArray;
/// 代理回调
@property (weak, nonatomic) id <EHFormTableViewDelegate> formDelegate;
/// 开启自动滚动到文本框 - 防止键盘遮挡
@property (assign, nonatomic) BOOL autoScrollToTextField;


/// 插入表单
/// @param name 标题
/// @param value 值
/// @param cellClass cell类型
/// @param useXib 是否使用Xib(区分注册方法)
/// @param canTap 是否可点击(只负责tableView原生点击)
/// @param canSelected 是否可选中
/// @param rowHeight 行高
/// @param separatorHeight 分割线高
/// @param separatorColor 分割线颜色
/// @param separatorOffset 分割线偏移量
/// @param callBack 所有事件回调
- (EHFormModel *)addRowWithName:(NSString *)name
                          value:(NSString *)value
                      cellClass:(Class)cellClass
                         useXib:(BOOL)useXib
                         canTap:(BOOL)canTap
                    canSelected:(BOOL)canSelected
                      rowHeight:(CGFloat)rowHeight
                separatorHeight:(CGFloat)separatorHeight
                 separatorColor:(UIColor *)separatorColor
                separatorOffset:(CGFloat)separatorOffset
                          index:(NSInteger)index
                       callBack:(void (^) (EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary))callBack;


/// 快速普通表单
/// @param name 名称
/// @param value 值
/// @param cellClass cell类型
/// @param rowHeight 行高
/// @param callBack 所有事件回调
- (EHFormModel *)addNormalRowWithName:(NSString *)name
                                value:(NSString *)value
                            cellClass:(Class)cellClass
                            rowHeight:(CGFloat)rowHeight
                             callBack:(void (^) (EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary))callBack;
/// 快速普通表单
/// @param name 名称
/// @param value 值
/// @param cellClass cell类型
/// @param rowHeight 行高
/// @param index 位置
/// @param callBack 所有事件回调
- (EHFormModel *)addNormalRowWithName:(NSString *)name
                                value:(NSString *)value
                            cellClass:(Class)cellClass
                            rowHeight:(CGFloat)rowHeight
                                index:(NSInteger)index
                             callBack:(void (^) (EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary))callBack;

/// 插入不能点击的表单
/// @param name 名称
/// @param value 值
/// @param cellClass cell类型
/// @param rowHeight 行高
/// @param callBack 所有事件回调
- (EHFormModel *)addUnableTapRowWithName:(NSString *)name
                                   value:(NSString *)value
                               cellClass:(Class)cellClass
                               rowHeight:(CGFloat)rowHeight
                                callBack:(void (^)(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary))callBack;

/// 插入不能点击的表单
/// @param name 名称
/// @param value 值
/// @param cellClass cell类型
/// @param rowHeight 行高
/// @param index 位置
/// @param callBack 所有事件回调
- (EHFormModel *)addUnableTapRowWithName:(NSString *)name
                                   value:(NSString *)value
                               cellClass:(Class)cellClass
                               rowHeight:(CGFloat)rowHeight
                                   index:(NSInteger)index
                                callBack:(void (^)(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary))callBack;


/// 插入空白行
/// @param cellClass cell类型
/// @param backgroundColor 分隔行颜色
/// @param rowHeight 行高
/// @param separatorHeight 下划线高度
/// @param separatorColor 下划线颜色
/// @param separatorOffset 下划线偏移量
- (EHFormModel *)addWhiteRowWithCellClass:(Class)cellClass
                          BackgroundColor:(UIColor *)backgroundColor
                                rowHeight:(CGFloat)rowHeight
                          separatorHeight:(CGFloat)separatorHeight
                           separatorColor:(UIColor *)separatorColor
                          separatorOffset:(CGFloat)separatorOffset;

/// 插入空白行
/// @param cellClass cell类型
/// @param backgroundColor 分隔行颜色
/// @param rowHeight 行高
/// @param separatorHeight 下划线高度
/// @param separatorColor 下划线颜色
/// @param separatorOffset 下划线偏移量
/// @param index 位置
- (EHFormModel *)addWhiteRowWithCellClass:(Class)cellClass
                          BackgroundColor:(UIColor *)backgroundColor
                                rowHeight:(CGFloat)rowHeight
                          separatorHeight:(CGFloat)separatorHeight
                           separatorColor:(UIColor *)separatorColor
                          separatorOffset:(CGFloat)separatorOffset
                                    index:(NSInteger)index;


/// 根据ID获取第一个模型
/// @param ID 编号(name)
- (EHFormModel *)firstModelWithID:(NSString *)ID;

/// 根据ID获取indexPath
/// @param ID 编号(name)
- (NSIndexPath *)indexPathWithID:(NSString *)ID;

/// 根据model获取indexPath
/// @param model 模型
- (NSIndexPath *)indexPathWithModel:(EHFormModel *)model;

/// 根据ID刷新Cell
- (void)reloadDataWithID:(NSString *)ID;

/// 获取所有指定标题模型的数组
/// @param name 标题(name)
- (NSArray *)modelsWithName:(NSString *)name;

/// 根据索引获取model
/// @param index 索引位置
/// @param isReal 是否为真实索引 - 是否包含空白行 如果是YES 则把空白行都算在内
- (EHFormModel *)modelWithIndex:(NSInteger)index isReal:(BOOL)isReal;

/// 获取model的索引
/// @param model model
/// @param isReal 是否为真实索引 - 是否包含空白行 如果是YES 则把空白行都算在内
- (NSInteger)indexWithModel:(EHFormModel *)model isReal:(BOOL)isReal;

/// 设置键盘弹出和键盘收起的tableView高度参考
/// 此方法是解决键盘弹出时遮挡表单的问题
/// @param upHeight 键盘弹出tableView高度参考
/// @param downHeight 键盘收起tableView高度参考
- (void)setUpHeight:(CGFloat)upHeight downHeight:(CGFloat)downHeight;

/// 根据标题删除行
/// @param name 标题
/// @param reloadData 是否刷新
- (void)removeRowWithName:(NSString *)name reloadData:(BOOL)reloadData;


/// 根据index删除(索引数组中)的行
/// @param index 索引
/// @param reloadData 是否刷新
- (void)removeRowWithIndexFromIndexArray:(NSInteger)index reloadData:(BOOL)reloadData;


/// 根据index删除(数据源中)的行 -> 区别是索引数组中不包含空白行 所以删除空白行需要在数据源中进行删除
/// @param index 索引
/// @param reloadData 是否刷新
- (void)removeRowWithIndexFromSourceArray:(NSInteger)index reloadData:(BOOL)reloadData;

/// 导出键值对
- (NSMutableDictionary *)dumpNameAndValue;

/// 导出提交字典
- (NSMutableDictionary *)dumpSubmitDictionary;

/// 检测空值
- (BOOL)checkEmpty;

/// 检测空值(修改检测: 与上面不同的是 没改动过的字段不被认为是空值)
- (BOOL)checkAlterEmpty;



@end
