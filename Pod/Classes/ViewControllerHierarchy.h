//
//  UIHierarchy.h
//  CVKHierarchySearcher
//
//  Created by Romans Karpelcevs on 21/10/14.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;
@class UINavigationController;

@protocol ViewControllerHierarchy <NSObject>

- (UIViewController *)topmostViewController;
- (UIViewController *)topmostNonModalViewController;
- (UINavigationController *)topmostNavigationController;

@end
