//
//  TableStyleViewController.m
//  Demo
//
//  Created by 李永杰 on 2019/8/13.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "TableStyleViewController.h"
#import "CustomTableViewCell.h"
#import "TableModel.h"

@interface TableStyleViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, strong) UITableView *tableView;

@property (assign, nonatomic, getter=isLoaded) BOOL loaded;

@end

@implementation TableStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
    self.data = [self requestData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableViewCellID"];
    if (self.isLoaded) {
        TableModel *model = self.data[indexPath.row];
        cell.model        = model;
    }
    cell.isLoaded = self.isLoaded;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.isLoaded) {
        return _data.count;
    }
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView            = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"CustomTableViewCellID"];
    }
    return _tableView;
}

- (NSMutableArray *)requestData {
    self.data = [NSMutableArray array];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *arr = @[
            @{ @"avator" : @"Shiba",
               @"title" : @"狂野飙车：极速凌云",
               @"detail" : @"一款由gameloft开发的经典系列赛车游戏" },
            @{ @"avator" : @"Shiba",
               @"title" : @"狂野飙车：极速凌云",
               @"detail" : @"一款由gameloft开发的经典系列赛车游戏" },
            @{ @"avator" : @"Shiba",
               @"title" : @"狂野飙车：极速凌云",
               @"detail" : @"一款由gameloft开发的经典系列赛车游戏" },
            @{ @"avator" : @"Shiba",
               @"title" : @"狂野飙车：极速凌云",
               @"detail" : @"一款由gameloft开发的经典系列赛车游戏" },
            @{ @"avator" : @"Shiba",
               @"title" : @"狂野飙车：极速凌云",
               @"detail" : @"一款由gameloft开发的经典系列赛车游戏" },
            @{ @"avator" : @"Shiba",
               @"title" : @"狂野飙车：极速凌云",
               @"detail" : @"一款由gameloft开发的经典系列赛车游戏" },
            @{ @"avator" : @"Shiba",
               @"title" : @"狂野飙车：极速凌云",
               @"detail" : @"一款由gameloft开发的经典系列赛车游戏" }
        ];
        for (NSDictionary *dic in arr) {
            TableModel *model = [[TableModel alloc]initWithDic:dic];
            [self.data addObject:model];
        }
        self.loaded = YES;
        [self.tableView reloadData];
    });

    return self.data;
}
@end
