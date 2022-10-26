//
//  EHTapTableViewCell.m
//  ExpandHouseProject
//
//  Created by 张祎 on 2018/1/18.
//  Copyright © 2018年 张祎. All rights reserved.
//

#import "EHTapTableViewCell.h"

@interface EHTapTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end

@implementation EHTapTableViewCell

- (void)setModel:(EHFormModel *)model {
    [super setModel:model];
    self.nameLabel.text = model.name;
    self.detailLabel.text = model.value;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.arrowsButton.userInteractionEnabled = NO;
    [self.arrowsButton setImage:[[UIImage imageNamed:@"EHFormResources.bundle/arrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    self.arrowsButton.tintColor = [UIColor colorWithRed:197 / 255.0 green:197 / 255.0 blue:202 / 255.0 alpha:1];
}

@end
