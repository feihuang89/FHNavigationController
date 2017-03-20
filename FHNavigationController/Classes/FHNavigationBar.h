//
//  PKNavigationBar.h
//  PicoocCoach
//
//  Created by Africa on 16/12/2.
//  Copyright © 2016年 Africa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FHNavigationBar : UINavigationBar

/**
 设置全局的导航栏背景图片

 @param globalImage 导航栏背景图片
 */
+ (void)setGlobalBackGroundImage:(UIImage *)globalImage;

/**
 设置全局title字体颜色  字号大小

 @param globalTextColor 全局字体颜色
 @param fontSize 全局字体大小
 */
+ (void)setGlobalTextColor:(UIColor *)globalTextColor fontSize:(CGFloat)fontSize;

@end
