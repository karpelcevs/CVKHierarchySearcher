//
//  CVKHierarchySearcher.h
//  CVKHierarchySearcher
//
//  Created by Romans Karpelcevs on 12/10/14.
//  Copyright (c) 2014 Romans Karpelcevs. All rights reserved.
//

#import "ViewControllerHierarchy.h"

@interface CVKHierarchySearcher : NSObject <ViewControllerHierarchy>

@property (nonatomic, readonly) UIViewController *topmostViewController;
@property (nonatomic, readonly) UIViewController *topmostNonModalViewController;
@property (nonatomic, readonly) UINavigationController *topmostNavigationController;

@end
