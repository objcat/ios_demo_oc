//
//  EHButtonTableViewCell.m
//  DABAN
//
//  Created by 张祎 on 2018/9/13.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "EHButtonTableViewCell.h"

@interface EHButtonTableViewCell ()
@property (strong, nonatomic) UIButton *button;
@end

@implementation EHButtonTableViewCell

- (void)setModel:(EHFormModel *)model {
    [super setModel:model];
    [self.button setTitle:model.name forState:UIControlStateNormal];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.button];
    }
    return self;
}

- (void)onClick:(UIButton *)button {
    if (self.callBack) {
        self.callBack(self.model);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.button.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
}

@end
