//
//  EHFormTableViewCell.m
//  ExpandHouseProject
//
//  Created by 张祎 on 2018/1/18.
//  Copyright © 2018年 张祎. All rights reserved.
//

#import "EHFormTableViewCell.h"

@implementation EHFormTableViewCell

- (void)setModel:(EHFormModel *)model {
    _model = model;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addLineLayer];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self addLineLayer];
}

- (void)addLineLayer {
    if (!self.lineLayer) {
        self.lineLayer = [[CALayer alloc] init];
        [self.contentView.layer addSublayer:self.lineLayer];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lineLayer.frame = CGRectMake(self.model.separatorOffset, self.contentView.frame.size.height - self.model.separatorHeight, self.contentView.frame.size.width - self.model.separatorOffset * 2, self.model.separatorHeight);
    self.lineLayer.backgroundColor = self.model.separatorColor.CGColor;
}

@end
