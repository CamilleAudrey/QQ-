//
//  SectionHeaderView.h
//  LMQQFriendsList
//
//  Created by imac on 2018/4/11.
//  Copyright © 2018年 Guowu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMSectionModel;

//自定义Block
typedef void(^HeaderViewClickedBack)(BOOL);

@interface SectionHeaderView : UITableViewHeaderFooterView

@property(nonatomic, strong)LMSectionModel *sectionModel;
@property (nonatomic, copy) HeaderViewClickedBack HeaderClickedBack;

@end

