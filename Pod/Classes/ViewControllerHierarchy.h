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

@property (nonatomic, readonly) UIViewController *topmostViewController;
@property (nonatomic, readonly) UIViewController *topmostNonModalViewController;
@property (nonatomic, readonly) UINavigationController *topmostNavigationController;

@end
