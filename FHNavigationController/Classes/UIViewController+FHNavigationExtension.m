//
//  UIViewController+FHNavigationExtension.m
//  Pods
//
//  Created by Africa on 17/3/19.
//
//

#import "UIViewController+FHNavigationExtension.h"
#import <objc/runtime.h>

@implementation UIViewController (FHNavigationExtension)

-(BOOL)fh_fullScreenPopEnabled
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

-(void)setFh_fullScreenPopEnabled:(BOOL)fh_fullScreenPopEnabled
{
    objc_setAssociatedObject(self, @selector(fh_fullScreenPopEnabled), @(fh_fullScreenPopEnabled), OBJC_ASSOCIATION_ASSIGN);
}

@end
