//
//  EHFormTableViewCell.h
//  ExpandHouseProject
//
//  Created by 张祎 on 2018/1/18.
//  Copyright © 2018年 张祎. All rights reserved.
//

#import "EHFormModel.h"

@interface EHFormTableViewCell : UITableViewCell
@property (copy, nonatomic) void (^callBack) (EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary);
@property (strong, nonatomic) void (^beginEditingBlock) (EHFormModel *model);
@property (nonatomic, strong) CALayer *lineLayer;
@property (nonatomic, strong) EHFormModel *model;
@end
