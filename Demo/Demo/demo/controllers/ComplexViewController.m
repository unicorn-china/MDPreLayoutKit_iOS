//
//  ComplexViewController.m
//  Demo
//
//  Created by 李永杰 on 2019/8/13.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "ComplexViewController.h"
#import "ComplexView.h"

@interface ComplexViewController ()

@property (nonatomic, strong) ComplexView *complexView;

@property (assign, nonatomic, getter=isLoaded) BOOL loaded;

@end

@implementation ComplexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.complexView];
    [self requestData];
}

- (void)requestData {
    self.complexView.loaded = self.isLoaded;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.loaded             = YES;
        self.complexView.loaded = self.isLoaded;
    });
}

- (ComplexView *)complexView {
    if (!_complexView) {
        _complexView = [[ComplexView alloc] initWithFrame:self.view.bounds];
    }
    return _complexView;
}

@end
