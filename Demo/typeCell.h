//
//  typeCell.h
//  Demo
//
//  Created by 王俊钢 on 2018/10/10.
//  Copyright © 2018 wangjungang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class typeModel;

//创建一个代理
@protocol myTabVdelegate <NSObject>
-(void)myTabVClick:(NSMutableArray *)array;
@end

@interface typeCell : UITableViewCell
@property (nonatomic,strong) UILabel *leftLab;
@property(assign,nonatomic)id<myTabVdelegate>delegate;
-(void)settagview:(typeModel *)model andarray:(NSArray *)array;
@end

NS_ASSUME_NONNULL_END
