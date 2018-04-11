//
//  SubTableViewCell.h
//  LMQQFriendsList
//
//  Created by imac on 2018/4/11.
//  Copyright © 2018年 Guowu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMSubCellModel;
@interface SubTableViewCell : UITableViewCell

@property(nonatomic, strong)LMSubCellModel *subModel;
@property(nonatomic, strong)UILabel *titleLabel;

@end
