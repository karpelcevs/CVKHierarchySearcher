//
//  CVKHierarchySearcher.m
//  CVKHierarchySearcher
//
//  Created by Romans Karpelcevs on 12/10/14.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

@import UIKit;

#import "CVKHierarchySearcher.h"

@implementation CVKHierarchySearcher

- (UIViewController *)topmostViewController
{
    return [self topmostViewControllerFrom:[[self baseWindow] rootViewController]
                              includeModal:YES];
}

- (UIViewController *)topmostNonModalViewController
{
    return [self topmostViewControllerFrom:[[self baseWindow] rootViewController]
                              includeModal:NO];
}

- (UINavigationController *)topmostNavigationController
{
    return [self topmostNavigationControllerFrom:[self topmostViewController]];
}

- (UINavigationController *)topmostNavigationControllerFrom:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UINavigationController class]])
        return (UINavigationController *)vc;
    if ([vc navigationController])
        return [vc navigationController];

    return nil;
}

- (UIViewController *)topmostViewControllerFrom:(UIViewController *)viewController
                                   includeModal:(BOOL)includeModal
{
    if ([viewController respondsToSelector:@selector(selectedViewController)])
        return [self topmostViewControllerFrom:[(id)viewController selectedViewController]
                                  includeModal:includeModal];

    if (includeModal && viewController.presentedViewController)
        return [self topmostViewControllerFrom:viewController.presentedViewController
                                  includeModal:includeModal];

    if ([viewController respondsToSelector:@selector(topViewController)])
        return [self topmostViewControllerFrom:[(id)viewController topViewController]
                                  includeModal:includeModal];

    return viewController;
}

- (UIWindow *)baseWindow
{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    if (!window)
        window = [[UIApplication sharedApplication] keyWindow];

    NSAssert(window != nil, @"No window to calculate hierarchy from");
    return window;
}

@end
