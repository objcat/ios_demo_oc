//
//  EHSwitchTableViewCell.m
//  DABAN
//
//  Created by 张祎 on 2018/9/12.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "EHSwitchTableViewCell.h"

@interface EHSwitchTableViewCell ()

@end

@implementation EHSwitchTableViewCell

- (void)setModel:(EHFormModel *)model {
    [super setModel:model];
    self.nameLabel.text = model.name;
    self.switchz.on = model.on;
}

- (IBAction)valueChanged:(id)sender {
    if (self.callBack) {
        UISwitch *switchz = sender;
        self.model.on = switchz.on;
        self.callBack(self.model);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
