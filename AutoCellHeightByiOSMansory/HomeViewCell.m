//
//  HomeViewCell.m
//  AutoCellHeightByiOSMansory
//
//  Created by langyue on 15/12/7.
//  Copyright © 2015年 langyue. All rights reserved.
//

#import "HomeViewCell.h"
#import "Masonry.h"




#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;


#define iconH 80
#define iconW 100

#define marginW 10


@interface HomeViewCell ()

@property(nonatomic,weak)UIImageView * icon;
@property(nonatomic,weak)UILabel * content;
@property(nonatomic,weak)UIImageView * line;

@property(nonatomic,assign)CGFloat contentLabelH;



@end


@implementation HomeViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupUI];
        
    }
    return self;
}


-(void)setupUI{
    
    UIImageView * icon = [UIImageView new];
    icon.contentMode = UIViewContentModeScaleAspectFill;
    icon.clipsToBounds = YES;
    [self.contentView addSubview:icon];
    self.icon = icon;
    
    UILabel * content = [UILabel new];
    content.numberOfLines = 0;
    content.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:content];
    self.content = content;
    
    UIImageView * line = [UIImageView new];
    line.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:line];
    self.line = line;
    
    
    __weak __typeof(&*self)weakSelf = self;
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.height.mas_equalTo(iconH);
        make.width.mas_equalTo(iconW);
        make.top.equalTo(weakSelf.mas_top).offset(marginW);
        make.centerX.equalTo(weakSelf.mas_centerX);
        
    }];
    
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(weakSelf.icon.mas_bottom).offset(marginW);
        make.left.equalTo(weakSelf.mas_left).offset(marginW);
        make.right.equalTo(weakSelf.mas_right).offset(-marginW);
        
        
    }];
    
    
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.height.mas_equalTo(0.5);
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.right.equalTo(weakSelf.mas_right).offset(0);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-marginW);
        
        
    }];
    
    
    
}

-(void)setHomeModel:(HomeModel *)homeModel{
    _homeModel = homeModel;
    self.icon.image = [UIImage imageNamed:homeModel.icon];
    self.content.text = homeModel.content;
}

-(CGFloat)rowHeightWithCellModel:(HomeModel *)homeModel{
    
    _homeModel = homeModel;
    __weak __typeof(&*self)weakSelf = self;
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(weakSelf.contentLabelH);
    }];
    //
    [self layoutIfNeeded];
    
    CGFloat h = CGRectGetMaxY(self.content.frame);
    return h + marginW;
    
}

-(CGFloat)contentLabelH{
    if (!_contentLabelH) {
        CGFloat h = [self.homeModel.content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-2*marginW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
        _contentLabelH = h+marginW;
    }
    return _contentLabelH;
}


- (void)awakeFromNib {
    // Initialization code
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
