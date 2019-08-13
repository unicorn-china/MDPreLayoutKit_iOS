//
//  CustomTableViewCell.h
//  Demo
//
//  Created by 李永杰 on 2019/8/13.
//  Copyright © 2019 muheda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableModel.h"
@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, strong) TableModel    *model;


@property (nonatomic, assign) BOOL          isLoaded;
@end

