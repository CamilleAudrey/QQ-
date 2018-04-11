//
//  TableViewController.m
//  LMQQFriendsList
//
//  Created by imac on 2018/4/11.
//  Copyright © 2018年 Guowu. All rights reserved.
//

#import "TableViewController.h"
#import "DHGuidePageHUD.h"


#import "LMSectionModel.h"
#import "LMSubCellModel.h"
#import "SectionHeaderView.h"
#import "SubTableViewCell.h"

#define ScreenSize  ([UIScreen mainScreen].bounds.size)
#define BOOLFORKEY @"dhGuidePage"

@interface TableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *baseTableView;
@property(nonatomic, strong)NSArray <LMSectionModel *> *datas;

@end

@implementation TableViewController
-(UITableView *)baseTableView{
    if (!_baseTableView) {
        _baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, ScreenSize.height) style:UITableViewStylePlain];
        _baseTableView.delegate = self;
        _baseTableView.dataSource = self;
        _baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _baseTableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSArray<LMSectionModel *> *)datas{
    if (!_datas) {
        _datas = [[NSArray alloc] init];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置APP引导页
    if ([[NSUserDefaults standardUserDefaults] boolForKey:BOOLFORKEY]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BOOLFORKEY];
        // 静态引导页
         // [self setStaticGuidePage];
        
        // 动态引导页
       //   [self setDynamicGuidePage];
        
        // 视频引导页
        [self setVideoGuidePage];
    }
    
    [LMSectionModel loadData:^(NSArray *models) {
        
        self.datas = models;
    }];
    
    [self.view addSubview:self.baseTableView];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
#pragma mark - 设置APP静态图片引导页
- (void)setStaticGuidePage {
    NSArray *imageNameArray = @[@"guideImage1.jpg",@"guideImage2.jpg",@"guideImage3.jpg",@"guideImage4.jpg",@"guideImage5.jpg"];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageNameArray:imageNameArray buttonIsHidden:NO];
    guidePage.slideInto = YES;
    [self.navigationController.view addSubview:guidePage];
}

#pragma mark - 设置APP动态图片引导页
- (void)setDynamicGuidePage {
    NSArray *imageNameArray = @[@"guideImage6.gif",@"guideImage7.gif",@"guideImage8.gif"];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageNameArray:imageNameArray buttonIsHidden:YES];
    guidePage.slideInto = YES;
    [self.navigationController.view addSubview:guidePage];
}

#pragma mark - 设置APP视频引导页
- (void)setVideoGuidePage {
    NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"guideMovie1" ofType:@"mov"]];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.bounds videoURL:videoURL];
    [self.navigationController.view addSubview:guidePage];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datas[section].isExpand ? (self.datas[section].subCellModels.count) : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCellID"];
    
    if (!cell) {
        
        cell = [[SubTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCellID"];
    }
    
    cell.subModel = self.datas[indexPath.section].subCellModels[indexPath.row];
    // 实际开发中不要这样设置
    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    cell.contentView.layer.borderColor = [UIColor cyanColor].CGColor;
    cell.contentView.layer.borderWidth = 0.5;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    SectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    
    if (!headerView) {
        headerView = [[SectionHeaderView alloc] initWithReuseIdentifier:@"header"];
    }
    headerView.sectionModel = self.datas[section];
    headerView.HeaderClickedBack = ^(BOOL isExpand) {
        [tableView reloadSections:[[NSIndexSet alloc] initWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    
    return  headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return  50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  40;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
