//
//  ConfigViewController.m
//  Demo
//
//  Created by 李永杰 on 2019/8/13.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "ConfigViewController.h"
#import "CommonView.h"
#import "MDPreLayoutKit.h"

@interface ConfigViewController ()

@property (nonatomic, strong) CommonView *commonView;

@end

@implementation ConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.commonView];

    MDPreLayoutConfig *config       = [[MDPreLayoutConfig alloc] init];
    config.preItemColor             = [UIColor redColor];
    config.cornerRadius             = 20;
    config.backgroundColor          = [UIColor yellowColor];
    self.commonView.preLayoutConfig = config;
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
