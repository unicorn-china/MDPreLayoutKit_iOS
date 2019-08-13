//
//  TableModel.h
//  Demo
//
//  Created by 李永杰 on 2019/8/13.
//  Copyright © 2019 muheda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableModel : NSObject

@property (nonatomic, copy) NSString *avator;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
