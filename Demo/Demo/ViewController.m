//
//  ViewController.m
//  Demo
//
//  Created by 李永杰 on 2019/8/12.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "ViewController.h"
#import "MDPreLayoutKit.h"
#import "CommonView.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, copy) NSArray         *typeArr;
@property (nonatomic, copy) NSArray         *controllers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _typeArr = @[@"默认布局",@"配置样式",@"列表样式",@"自定义样式"];
    _controllers = @[@"CommonViewController",@"ConfigViewController",@"TableStyleViewController",@"ComplexViewController"];
    [self.view addSubview:self.tableView];
}

#pragma mark 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _typeArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    cell.textLabel.text = _typeArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *vcStr = _controllers[indexPath.row];
    UIViewController *vc = [[NSClassFromString(vcStr) alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellid"];
    }
    return _tableView;
}

@end
