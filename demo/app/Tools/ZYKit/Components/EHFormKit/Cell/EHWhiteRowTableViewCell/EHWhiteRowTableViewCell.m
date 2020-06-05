//
//  EHWhiteRowTableViewCell.m
//  DABAN
//
//  Created by 张祎 on 2018/9/13.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "EHWhiteRowTableViewCell.h"

@interface EHWhiteRowTableViewCell ()
@property (strong, nonatomic) UIView *fullView;
@end

@implementation EHWhiteRowTableViewCell

- (void)setModel:(EHFormModel *)model {
    [super setModel:model];
    self.fullView.backgroundColor = model.backgroundColor;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.fullView = [[UIView alloc] init];
        [self.contentView addSubview:self.fullView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.fullView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height - self.model.separatorHeight);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
