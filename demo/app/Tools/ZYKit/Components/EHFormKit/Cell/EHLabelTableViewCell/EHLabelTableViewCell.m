//
//  EHLabelTableViewCell.m
//  ExpandHouseProject
//
//  Created by 张祎 on 2018/1/24.
//  Copyright © 2018年 张祎. All rights reserved.
//

#import "EHLabelTableViewCell.h"

@implementation EHLabelTableViewCell

- (void)setModel:(EHFormModel *)model {
    [super setModel:model];
    self.nameLabel.text = model.name;
    self.valueLabel.text = model.value;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
