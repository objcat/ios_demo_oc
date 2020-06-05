//
//  EHSwitchTableViewCell.h
//  DABAN
//
//  Created by 张祎 on 2018/9/12.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "EHFormTableViewCell.h"

@interface EHSwitchTableViewCell : EHFormTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switchz;
@end
