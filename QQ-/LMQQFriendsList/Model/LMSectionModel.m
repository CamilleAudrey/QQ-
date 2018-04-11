//
//  LMSectionModel.m
//  LMQQFriendsList
//
//  Created by imac on 2018/4/11.
//  Copyright © 2018年 Guowu. All rights reserved.
//

#import "LMSectionModel.h"
#import "LMSubCellModel.h"

@implementation LMSectionModel

+ (void)loadData:(void(^)(NSArray *models))finished{
    //存放最外层的model
    NSMutableArray *dataArr = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"headerList.plist" ofType:nil];
    NSDictionary *diaryList = [NSDictionary dictionaryWithContentsOfFile:path];
    
    
    NSArray *allKeys = diaryList.allKeys;
    NSArray *allValues = diaryList.allValues;
    
    for (NSInteger i = 0; i<allKeys.count ; i++) {
        
        LMSectionModel *sectionModel = [[LMSectionModel alloc] init];
        sectionModel.isExpand = NO;
        sectionModel.sectionTitle = allKeys[i];
        
        NSMutableArray *cellArr = [NSMutableArray array];
        for (NSInteger j = 0; j<((NSArray *)allValues[i]).count; j++) {
            
            LMSubCellModel *cellModel = [[LMSubCellModel alloc] init];
            cellModel.title = allValues[i][j];
            [cellArr addObject:cellModel];
            
        }
        
        sectionModel.subCellModels = cellArr;
        [dataArr addObject:sectionModel];
        
    }
    
    finished(dataArr);

}
@end
