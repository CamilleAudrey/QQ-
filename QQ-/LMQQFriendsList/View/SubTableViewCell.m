//
//  SubTableViewCell.m
//  LMQQFriendsList
//
//  Created by imac on 2018/4/11.
//  Copyright © 2018年 Guowu. All rights reserved.
//

#import "SubTableViewCell.h"
#import "LMSubCellModel.h"

@implementation SubTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setUI{
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame))];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:_titleLabel];
    
}
-(void)setSubModel:(LMSubCellModel *)subModel{
    _subModel = subModel;
    _titleLabel.text = subModel.title;
}
@end
