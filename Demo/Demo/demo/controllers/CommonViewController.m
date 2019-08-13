//
//  CommonViewController.m
//  Demo
//
//  Created by 李永杰 on 2019/8/13.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "CommonViewController.h"
#import "CommonView.h"
#import "MDPreLayoutKit.h"

@interface CommonViewController ()

@property (nonatomic, strong) CommonView *commonView;

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.commonView];

    [self requestData];
}
- (void)requestData {
    
    [self.commonView beginPreLayout];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.commonView endPreLayout];
    });
}
- (CommonView *)commonView {
    if (!_commonView) {
        _commonView = [[CommonView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    }
    return _commonView;
}
@end
