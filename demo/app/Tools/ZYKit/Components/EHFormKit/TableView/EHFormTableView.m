//
//  EHFormTableView.m
//  ExpandHouse
//
//  Created by 张祎 on 2018/9/12.
//  Copyright © 2018年 objcat. All rights reserved.
//  https://github.com/objcat/EHFormKit

#import "EHFormTableView.h"
#import "EHFormTableViewCell.h"
#import "EHWhiteRowTableViewCell.h"

#define TABLEFRAME self.frame

@interface EHFormTableView () <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

/// 数据源
@property (strong, nonatomic) NSMutableArray *sourceArray;
/// 字典索引
@property (strong, nonatomic) NSMutableDictionary *indexDic;

/// 线的颜色
@property (strong, nonatomic) UIColor *sColor;
/// 线的偏移量
@property (assign, nonatomic) CGFloat sOffset;

/// 键盘弹出tableView高度参考
@property (assign, nonatomic) CGFloat upHeight;
/// 键盘收起tableView高度参考
@property (assign, nonatomic) CGFloat downHeight;

/// 处于编辑的行
@property (assign, nonatomic) NSInteger editRow;

@end

@implementation EHFormTableView

+ (instancetype)tableView {
    EHFormTableView *tableView = [[self alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor whiteColor];
    return tableView;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.sColor = [UIColor colorWithRed:221 / 255.0 green:221 / 255.0 blue:221 / 255.0 alpha:1];
        self.sOffset = 15;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShown:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)keyboardWillShown:(NSNotification *)notification {
    if (!self.autoScrollToTextField) {
        return;
    }
    NSDictionary *userInfo = [notification userInfo];
    CGFloat duration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    [UIView animateWithDuration:duration animations:^{
        CGRect frame = self.frame;
        frame.size.height = self.upHeight - keyboardSize.height;
        self.frame = frame;
    }];
}

- (void)keyboardWillBeHidden:(NSNotification *)notification {
    if (!self.autoScrollToTextField) {
        return;
    }
    NSDictionary *userInfo = [notification userInfo];
    CGFloat duration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        CGRect frame = self.frame;
        frame.size.height = self.downHeight;
        self.frame = frame;
    }];
}

- (EHFormModel *)modelWithIndex:(NSInteger)index isReal:(BOOL)isReal {
    if (isReal) {
        return self.sourceArray[index];
    } else {
        return self.indexArray[index];
    }
}

- (NSInteger)indexWithModel:(EHFormModel *)model isReal:(BOOL)isReal {
    NSInteger index = 0;
    if (isReal) {
        index = [self.sourceArray indexOfObject:model];
    } else {
        index = [self.indexArray indexOfObject:model];
    }
    return index;
}

- (UIViewController *)getSuperViewController:(UIView *)view {
    for (UIView *next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

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
                       callBack:(void (^) (EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary))callBack {
    
    EHFormModel *model = [[EHFormModel alloc] init];
    model.ID = name;
    model.name = name;
    model.value = value ? : @"";
    model.cellClass = cellClass;
    model.useXib = useXib;
    model.canSelected = canSelected;
    model.canTap = canTap;
    model.callBack = callBack;
    model.rowHeight = rowHeight;
    model.separatorHeight = separatorHeight;
    model.separatorColor = separatorColor;
    model.separatorOffset = separatorOffset;
    model.userInteractionEnabled = YES;
    model.tableView = self;
    
    if (index == -1) {
        [self.sourceArray addObject:model];
    } else {
        [self.sourceArray insertObject:model atIndex:index];
    }
    
    return model;
}

- (EHFormModel *)addNormalRowWithName:(NSString *)name
                                value:(NSString *)value
                            cellClass:(Class)cellClass
                            rowHeight:(CGFloat)rowHeight
                             callBack:(void (^)(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary))callBack {
    return [self addRowWithName:name value:value cellClass:cellClass useXib:YES canTap:YES canSelected:YES rowHeight:rowHeight separatorHeight:0 separatorColor:self.sColor separatorOffset:self.sOffset index:-1 callBack:callBack];
}

- (EHFormModel *)addNormalRowWithName:(NSString *)name
                                value:(NSString *)value
                            cellClass:(Class)cellClass
                            rowHeight:(CGFloat)rowHeight
                                index:(NSInteger)index
                             callBack:(void (^)(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary))callBack {
    return [self addRowWithName:name value:value cellClass:cellClass useXib:YES canTap:YES canSelected:YES rowHeight:rowHeight separatorHeight:0 separatorColor:self.sColor separatorOffset:self.sOffset index:index callBack:callBack];
}


- (EHFormModel *)addUnableTapRowWithName:(NSString *)name
                                   value:(NSString *)value
                               cellClass:(Class)cellClass
                               rowHeight:(CGFloat)rowHeight
                                callBack:(void (^)(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary))callBack {
    return [self addRowWithName:name value:value cellClass:cellClass useXib:YES canTap:NO canSelected:NO rowHeight:rowHeight separatorHeight:0 separatorColor:self.sColor separatorOffset:self.sOffset index:-1 callBack:callBack];
}



- (EHFormModel *)addUnableTapRowWithName:(NSString *)name
                                   value:(NSString *)value
                               cellClass:(Class)cellClass
                               rowHeight:(CGFloat)rowHeight
                                   index:(NSInteger)index
                                callBack:(void (^)(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary))callBack {
    return [self addRowWithName:name value:value cellClass:cellClass useXib:YES canTap:NO canSelected:NO rowHeight:rowHeight separatorHeight:0 separatorColor:self.sColor separatorOffset:self.sOffset index:index callBack:callBack];
}

- (EHFormModel *)addWhiteRowWithCellClass:(Class)cellClass
                          BackgroundColor:(UIColor *)backgroundColor
                                rowHeight:(CGFloat)rowHeight
                          separatorHeight:(CGFloat)separatorHeight
                           separatorColor:(UIColor *)separatorColor
                          separatorOffset:(CGFloat)separatorOffset {
    return [self addWhiteRowWithCellClass:cellClass BackgroundColor:backgroundColor rowHeight:rowHeight separatorHeight:separatorHeight separatorColor:separatorColor separatorOffset:separatorOffset index:-1];
}

- (EHFormModel *)addWhiteRowWithCellClass:(Class)cellClass
                          BackgroundColor:(UIColor *)backgroundColor
                                rowHeight:(CGFloat)rowHeight
                          separatorHeight:(CGFloat)separatorHeight
                           separatorColor:(UIColor *)separatorColor
                          separatorOffset:(CGFloat)separatorOffset
                                    index:(NSInteger)index {
    
    EHFormModel *whiteRow = [[EHFormModel alloc] init];
    whiteRow.rowHeight = rowHeight;
    whiteRow.isWhiteRow = YES;
    whiteRow.cellClass = cellClass;
    whiteRow.separatorHeight = separatorHeight;
    whiteRow.separatorColor = separatorColor;
    whiteRow.separatorOffset = separatorOffset;
    whiteRow.backgroundColor = backgroundColor;
    
    if (index == -1) {
        [self.sourceArray addObject:whiteRow];
    } else {
        [self.sourceArray insertObject:whiteRow atIndex:index];
    }
    
    return whiteRow;
}

- (NSMutableArray *)sourceArray {
    if (!_sourceArray) {
        _sourceArray = [NSMutableArray array];
    }
    return _sourceArray;
}

- (NSMutableArray *)indexArray {
    NSMutableArray *arr = [NSMutableArray array];
    for (EHFormModel *model in self.sourceArray) {
        if (!model.isWhiteRow) {
            [arr addObject:model];
        }
    }
    return arr;
}

- (void)removeAllCells {
    self.sourceArray = [NSMutableArray array];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EHFormModel *model = self.sourceArray[indexPath.row];
    
    NSString *cellName = NSStringFromClass(model.cellClass);
    
    // 检测是否注册 经调研 反复注册并不会引发性能问题
    if (model.useXib) {
        [self registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:model.reuseId];
    } else {
        [self registerClass:NSClassFromString(cellName) forCellReuseIdentifier:model.reuseId];
    }
    
    __weak typeof(self) weakSelf = self;
    // 使用多态节省代码
    EHFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.reuseId forIndexPath:indexPath];
    cell.model = model;
    // 事件回调
    cell.callBack = model.callBack;
    // 开始编辑回调
    cell.beginEditingBlock = ^(EHFormModel *formModel){
        // 获取文本框所在行, 主要用于滚动到所在行, 防止键盘遮挡文本输入框, 默认不开启 autoScrollToTextField
        weakSelf.editRow = [weakSelf.sourceArray indexOfObject:formModel];
    };
    // 设置是否可选中
    if (model.canSelected) {
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    } else {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.contentView.userInteractionEnabled = model.userInteractionEnabled;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    EHFormModel *model = self.sourceArray[indexPath.row];
    return model.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EHFormModel *model = self.sourceArray[indexPath.row];
    if (model.callBack && model.canTap) {
        model.callBack(model, EHFormModelEventTypeCell, nil);
    }
    [self endEditing:YES];
}

- (void)setUpHeight:(CGFloat)upHeight downHeight:(CGFloat)downHeight {
    self.upHeight = upHeight;
    self.downHeight = downHeight;
}

- (void)setUpHeight:(CGFloat)upHeight {
    if (_upHeight == 0) {
        _upHeight = upHeight;
    }
}

- (void)setDownHeight:(CGFloat)downHeight {
    if (_downHeight == 0) {
        _downHeight = downHeight;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // X 414 896
    UIViewController *vc = [self viewController];
    CGFloat bottomHeight = 0;
    if (@available(iOS 11.0, *)) {
        bottomHeight = vc.view.safeAreaInsets.bottom;
    }
    self.upHeight = self.frame.size.height + bottomHeight;
    self.downHeight = self.frame.size.height;
}

- (UIViewController *)viewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.formDelegate && [self.formDelegate respondsToSelector:@selector(eh_scrollViewDidScroll:)]) {
        [self.formDelegate eh_scrollViewDidScroll:scrollView];
    }
}

- (void)removeRowWithName:(NSString *)title reloadData:(BOOL)reloadData {
    EHFormModel *model = self.indexDic[title];
    NSInteger index = [self.sourceArray indexOfObject:model];
    [self.indexDic removeObjectForKey:title];
    [self.sourceArray removeObject:model];
    [self deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:0];
}

- (void)removeRowWithIndexFromIndexArray:(NSInteger)index reloadData:(BOOL)reloadData {
    EHFormModel *model = self.indexArray[index];
    NSInteger realIndex = [self.sourceArray indexOfObject:model];
    [self.sourceArray removeObject:model];
    [self deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:realIndex inSection:0]] withRowAnimation:0];
}

- (void)removeRowWithIndexFromSourceArray:(NSInteger)index reloadData:(BOOL)reloadData {
    EHFormModel *model = self.sourceArray[index];
    [self.sourceArray removeObject:model];
    [self deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:0];
}

- (void)dealloc {
    NSLog(@"EHFormKit释放");
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [center removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (NSMutableDictionary *)dumpNameAndValue {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (EHFormModel *model in self.indexArray) {
        if (model.ID && ![model.ID isEqualToString:@""]) {
            dic[model.ID] = model.value ? : @"";
        }
    }
    return dic;
}

- (NSMutableDictionary *)dumpSubmitDictionary {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (EHFormModel *model in self.indexArray) {
        if (model.submitName && ![model.submitName isEqualToString:@""]) {
            dic[model.submitName] = model.submitValue ? : @"";
        }
    }
    return dic;
}

- (BOOL)checkEmpty {
    BOOL pass = YES;
    for (EHFormModel *model in self.indexArray) {
        if (!model.submitValue || [model.submitValue isEqualToString:@""]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"%@不能为空", model.submitName] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *determin = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:determin];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
            pass = NO;
            return pass;
        }
    }
    return pass;
}

- (BOOL)checkAlterEmpty {
    BOOL pass = YES;
    for (EHFormModel *model in self.indexArray) {
        if (!model.submitValue || [model.submitValue isEqualToString:@""]) {
            if (model.isChanged) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"%@不能为空", model.submitName] preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *determin = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                [alert addAction:determin];
                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
                pass = NO;
            }
            return pass;
        }
    }
    return pass;
}

- (EHFormModel *)firstModelWithID:(NSString *)ID {
    for (EHFormModel *model in self.sourceArray) {
        if ([model.ID isEqualToString:ID]) {
            return model;
        }
    }
    return nil;
}

- (NSIndexPath *)indexPathWithID:(NSString *)ID {
    for (EHFormModel *model in self.sourceArray) {
        if ([model.ID isEqualToString:ID]) {
            return [self indexPathWithModel:model];
        }
    }
    return nil;
}

- (NSIndexPath *)indexPathWithModel:(EHFormModel *)model {
    return [NSIndexPath indexPathForRow:[self.sourceArray indexOfObject:model] ? : 0 inSection:0];
}

- (void)reloadDataWithID:(NSString *)ID {
    EHFormModel *result = nil;
    for (EHFormModel *model in self.sourceArray) {
        if ([model.ID isEqualToString:ID]) {
            result = model;
        }
    }
    if (result != nil) {
        NSInteger index = [self.sourceArray indexOfObject:result];
        [UIView performWithoutAnimation:^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
            if (indexPath) {
                [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }
        }];
    }
}

- (NSArray *)modelsWithName:(NSString *)name {
    NSMutableArray *arr = [NSMutableArray array];
    for (EHFormModel *model in self.sourceArray) {
        if ([model.name isEqualToString:name]) {
            [arr addObject:model];
        }
    }
    return arr;
}

@end
