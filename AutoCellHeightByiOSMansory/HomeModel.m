//
//  HomeModel.m
//  AutoCellHeightByiOSMansory
//
//  Created by langyue on 15/12/7.
//  Copyright © 2015年 langyue. All rights reserved.
//

#import "HomeModel.h"
#import "HomeViewCell.h"

@implementation HomeModel

//惰性初始化
-(CGFloat)cellHeight{
    //只在初始化的时候调用一次就OK
    if (!_cellHeight) {
        HomeViewCell * cell = [[HomeViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:homeIdentifier];
        NSLog(@"我要计算高度");
        _cellHeight = [cell rowHeightWithCellModel:self];
        
    }
    return _cellHeight;
}





@end
