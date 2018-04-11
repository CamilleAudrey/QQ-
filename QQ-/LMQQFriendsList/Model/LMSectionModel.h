//
//  LMSectionModel.h
//  LMQQFriendsList
//
//  Created by imac on 2018/4/11.
//  Copyright © 2018年 Guowu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LMSubCellModel;
@interface LMSectionModel : NSObject

/*
 *  分组的头部标题
 */
@property(nonatomic, copy)NSString *sectionTitle;
/*
 *  是否展开显示子View
 */
@property(nonatomic, assign) BOOL isExpand;
/*
 *  子view的model数据 元素类型是SubCellModel
 */
@property(nonatomic, strong) NSArray<LMSubCellModel *> *subCellModels;


//block作为参数 格式与其他类型一致 都是 （类型）变量名
+ (void)loadData:(void(^)(NSArray *models))finished;


@end
