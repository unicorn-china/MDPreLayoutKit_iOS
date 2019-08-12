//
//  MDPreLayoutProtocol.h
//  Demo
//
//  Created by 李永杰 on 2019/8/12.
//  Copyright © 2019 muheda. All rights reserved.
//

#ifndef MDPreLayoutProtocol_h
#define MDPreLayoutProtocol_h

@class CALayer;

@protocol MDPreLayoutProtocol <NSObject>

@required

- (NSArray<CALayer *> *)preLayout;

@end

#endif /* MDPreLayoutProtocol_h */
