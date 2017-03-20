//
//  FHFirstViewController.m
//  FHNavigationController
//
//  Created by Africa on 17/3/19.
//  Copyright © 2017年 Africa802916. All rights reserved.
//

#import "FHFirstViewController.h"
#import <FHNavigationController/UIViewController+FHNavigationExtension.h>

static NSString *title = @"VC";

@interface FHFirstViewController ()<UIGestureRecognizerDelegate>

@end

@implementation FHFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat hue = ( arc4random() % 256 / 256.0 );
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
    
    self.view.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    self.title = [NSString stringWithFormat:@"%@%ld",title,self.navigationController.viewControllers.count];
    
    if (self.navigationController.viewControllers.count % 2) {
//        self.fh_fullScreenPopEnabled = YES;
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
    
    [self setUpSubViews];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.navigationController.viewControllers.count % 2) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
 
    if (!(self.navigationController.viewControllers.count % 2)) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)setUpSubViews
{
    UIButton *popBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    popBtn.frame = CGRectMake(0, 0, 100, 50);
    popBtn.center = self.view.center;
    [popBtn setTitle:@"popToRoot" forState:UIControlStateNormal];
    [popBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [popBtn addTarget:self action:@selector(popToRoot:) forControlEvents:UIControlEventTouchUpInside];
    popBtn.backgroundColor = [UIColor colorWithRed:0.00f green:0.48f blue:1.00f alpha:1.00f];
    popBtn.layer.cornerRadius = 5;
    popBtn.layer.masksToBounds = YES;
    [self.view addSubview:popBtn];
}

- (void)popToRoot:(UIButton *)btn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)next:(UIBarButtonItem *)barButtonItem
{
    FHFirstViewController *firstVC = [[FHFirstViewController alloc] init];
    [self.navigationController pushViewController:firstVC animated:YES];
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return NO;
}

@end
