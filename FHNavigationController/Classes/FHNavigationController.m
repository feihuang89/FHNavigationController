//
//  FHNavigationController.m
//  FHNavigationController
//
//  Created by Africa on 17/3/19.
//  Copyright © 2017年 Africa802916. All rights reserved.
//

#import "FHNavigationController.h"
#import "FHNavigationBar.h"
#import "UIViewController+FHNavigationExtension.h"

@interface FHNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

/** 全屏返回手势 */
@property (nonatomic, strong) UIPanGestureRecognizer *popPanGesture;
/** 系统边缘手势返回代理 */
@property (nonatomic, strong) id popGestureDelegate;

@end

@implementation FHNavigationController

//使用initWithRootViewController方法创建FHNavigationController实例，不会调用init方法
-(instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        //替换系统navBar
        [self setValue:[[FHNavigationBar alloc] init] forKey:@"navigationBar"];
        
        //设置默认的导航栏背景  239,239,244
        self.navigationBar.barTintColor = [UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];
        
        //去除导航栏黑线
        [FHNavigationBar setGlobalBackGroundImage:nil];
        
        //设置全局的title样式
        [FHNavigationBar setGlobalTextColor:[UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1] fontSize:17];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    self.popGestureDelegate = self.interactivePopGestureRecognizer.delegate;
    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    
    //设置全屏返回手势的代理为系统边缘返回手势的代理
    self.popPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.popGestureDelegate action:action];
    self.popPanGesture.maximumNumberOfTouches = 1;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //隐藏tabbar
    if (self.viewControllers.count > 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    BOOL isRootVC = viewController == navigationController.viewControllers.firstObject;
    
    if (viewController.fh_fullScreenPopEnabled) { //支持全屏返回
        if (isRootVC) { //根控制器移除全屏返回手势
            [self.view removeGestureRecognizer:self.popPanGesture];
        }else
        {
            [self.view addGestureRecognizer:self.popPanGesture];
        }
        
        self.interactivePopGestureRecognizer.delegate = self.popGestureDelegate;
        self.interactivePopGestureRecognizer.enabled = NO;
    }else
    {
        [self.view removeGestureRecognizer:self.popPanGesture];
        
        NSLog(@"interactivePopGestureRecognizer.delegate:%@",self.interactivePopGestureRecognizer.delegate);
        
        //设置边缘返回手势的默认代理
        if ([self.interactivePopGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_UINavigationInteractiveTransition")] || !self.interactivePopGestureRecognizer.delegate) {
            self.interactivePopGestureRecognizer.delegate = self;
        }
        
        //根控制器不可系统返回，不然会造成假死状态
        self.interactivePopGestureRecognizer.enabled = !isRootVC;
    }
}

#pragma mark - UIGestureRecognizerDelegate
//默认可以系统边缘返回
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

//允许多个手势同时响应 (防止页面有scrollView导致手势失效)
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

//是否要判断gestureRecognizer侦测失败，才可以侦测otherGestureRecognizer
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return [gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]];
}

@end
