//
//  TableModel.m
//  Demo
//
//  Created by 李永杰 on 2019/8/13.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "TableModel.h"

@implementation TableModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        _avator = dic[@"avator"];
        _title  = dic[@"title"];
        _detail = dic[@"detail"];
    }
    return self;
}

@end
