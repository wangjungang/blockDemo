//
//  typeViewController.h
//  Demo
//
//  Created by 王俊钢 on 2018/10/10.
//  Copyright © 2018 wangjungang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ReturnValueBlock) (NSMutableArray *arrayValue);

@interface typeViewController : UIViewController
/**
 *  声明一个ReturnValueBlock属性，这个Block是获取传值的界面传进来的
 */
@property(nonatomic, copy) ReturnValueBlock returnValueBlock;

@end

NS_ASSUME_NONNULL_END
