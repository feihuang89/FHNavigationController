//
//  PKNavigationBar.m
//  PicoocCoach
//
//  Created by Africa on 16/12/2.
//  Copyright © 2016年 Africa. All rights reserved.
//

#import "FHNavigationBar.h"

@implementation FHNavigationBar

+ (void)setGlobalBackGroundImage:(UIImage *)globalImage
{
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"FHNavigationController"), nil];
    [navBar setBackgroundImage:globalImage forBarMetrics:UIBarMetricsDefault];
    //全局去除导航栏底部黑线
    [navBar setShadowImage:[[UIImage alloc] init]];
}

+ (void)setGlobalTextColor:(UIColor *)globalTextColor fontSize:(CGFloat)fontSize
{
    if (!globalTextColor && fontSize == 0) return;
    
    if (fontSize < 6 || fontSize > 40) {
        fontSize = 16;
    }
    
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"FHNavigationController"), nil];
    NSDictionary *attributeDict = @{NSForegroundColorAttributeName:globalTextColor,
                                    NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:fontSize]
                                    };
    [navBar setTitleTextAttributes:attributeDict];
}

@end
