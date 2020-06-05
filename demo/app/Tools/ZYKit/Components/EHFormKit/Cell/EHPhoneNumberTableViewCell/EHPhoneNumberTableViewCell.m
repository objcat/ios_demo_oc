//
//  EHPhoneNumberTableViewCell.m
//  DABAN
//
//  Created by 张祎 on 2018/9/12.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "EHPhoneNumberTableViewCell.h"

@implementation EHPhoneNumberTableViewCell

- (void)setModel:(EHFormModel *)model {
    [super setModel:model];
    self.nameLabel.text = model.name;
    [self.phoneButton setTitle:model.value forState:UIControlStateNormal];
}

- (IBAction)touchUpInside:(id)sender {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.phoneButton.userInteractionEnabled = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
