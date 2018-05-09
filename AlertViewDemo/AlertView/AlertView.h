//
//  AlertView.h
//  JiuAiTou
//
//  Created by Aphy_Cui on 2018/5/7.
//  Copyright © 2018年 深圳万利金融. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertView : UIView


/**
 按钮点击block
 */
@property (nonatomic,copy) void(^AlertViewBlock)(AlertView *alertView,NSInteger index,NSString * title);

/**
 初始化方法

 @param frame 位置
 @param title 标题
 @param detail 内容
 @param btnArray 按钮文字数组（数组个数最多为2）
 @param btnBacColorArray 按钮颜色数组（一个按钮为数组为背景颜色，字体默认为白色；多个按钮为数组为字体颜色，背景默认为白色）
 @param showCloseBtn 关闭按钮是否显示
 @return 返回值
 */
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title detail:(NSString *)detail btnArray:(NSArray *)btnArray btnBacColorArray:(NSArray *)btnBacColorArray showCloseBtn:(BOOL)showCloseBtn;

- (void)remove;
@end
