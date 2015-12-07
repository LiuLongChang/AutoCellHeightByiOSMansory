//
//  HomeViewCell.h
//  AutoCellHeightByiOSMansory
//
//  Created by langyue on 15/12/7.
//  Copyright © 2015年 langyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"


@class homeModel;
static NSString * homeIdentifier = @"homeCell";


@interface HomeViewCell : UITableViewCell

//数据模型
@property(nonatomic,strong)HomeModel * homeModel;
//我们最后得到cell的高度的方法
-(CGFloat)rowHeightWithCellModel:(HomeModel*)homeModel;


@end
