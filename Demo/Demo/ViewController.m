//
//  ViewController.m
//  Demo
//
//  Created by 李永杰 on 2019/8/12.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "ViewController.h"
#import "MDPreLayoutKit.h"
#import "TestView.h"

@interface ViewController ()

@property (nonatomic, strong) TestView  *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"第一个" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn setFrame:CGRectMake(100, 100, 100, 30)];
    [self.view addSubview:btn];

    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"第二个" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor grayColor]];
    [btn1 setFrame:CGRectMake(100, 200, 100, 30)];
    [self.view addSubview:btn1];

    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"第三个" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [btn2 setFrame:CGRectMake(100, 300, 100, 30)];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setTitle:@"第四个" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setBackgroundColor:[UIColor grayColor]];
    [btn3 setFrame:CGRectMake(100, 400, 100, 30)];
    [self.view addSubview:btn3];
    
    self.view.preLayoutConfig = [[MDPreLayoutConfig alloc]init];
    self.view.preLayoutConfig.preItemColor = [UIColor greenColor];
    
    [self.view beginPreLayout];


    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(30 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view endPreLayout];
    });

    
//     手动添加演示
//    [self.view addSubview:self.testView];
//    [self.testView beginPreLayout];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.testView endPreLayout];
//    });
    
}

#pragma mark lazy
- (TestView *)testView {
    if (!_testView) {
        _testView = [[TestView alloc]initWithFrame:CGRectMake(100, 300, 200, 100)];
        _testView.backgroundColor = [UIColor whiteColor];
    }
    return _testView;
}

@end
