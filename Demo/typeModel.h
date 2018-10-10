//
//  typeModel.h
//  Demo
//
//  Created by 王俊钢 on 2018/10/10.
//  Copyright © 2018 wangjungang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface typeModel : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) BOOL ischoose;
@property (nonatomic,strong) UIColor *labColor;

@end

NS_ASSUME_NONNULL_END
