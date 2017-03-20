//
//  FHViewController.m
//  FHNavigationController
//
//  Created by Africa802916 on 03/19/2017.
//  Copyright (c) 2017 Africa802916. All rights reserved.
//

#import "FHViewController.h"
#import "FHFirstViewController.h"

@interface FHViewController ()

@end

@implementation FHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"VC1";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)next:(UIBarButtonItem *)barButtonItem
{
    FHFirstViewController *firstVC = [[FHFirstViewController alloc] init];
    [self.navigationController pushViewController:firstVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
