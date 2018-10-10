//
//  homeCell.h
//  Demo
//
//  Created by 王俊钢 on 2018/10/10.
//  Copyright © 2018 wangjungang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class typeModel;
@interface homeCell : UITableViewCell
@property (nonatomic,strong) UILabel *nameLab;
@property (nonatomic,strong) UILabel *contentLab;

-(void)settagview:(NSArray *)array;
@end

NS_ASSUME_NONNULL_END
