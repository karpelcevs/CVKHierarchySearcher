//
//  UIHierarchySpec.m
//  CVKHierarchySearcher
//
//  Created by Romans Karpelcevs on 12/10/14.
//  Copyright 2014 Romans Karpelcevs. All rights reserved.
//

@import UIKit;
#import "CVKHierarchySearcher.h"

SpecBegin(CVKHierarchySearcher)

__block UIViewController *root;
__block UIViewController *first;
__block UIViewController *second;
__block UINavigationController *navVC;

describe(@"CVKHierarchySearcher", ^{
    __block CVKHierarchySearcher *hierarchySearcher;
    beforeEach(^{
        hierarchySearcher = [[CVKHierarchySearcher alloc] init];
    });
    afterEach(^{
        root = [[UIViewController alloc] init];
        [[[UIApplication sharedApplication] keyWindow] setRootViewController:root];
        waitUntil(^(DoneCallback done) {
            // Just giving previous call some time
            done();
        });
    });

    describe(@"with empty hierarchy", ^{
        beforeEach(^{
            root = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        });
        it(@"should have topmost as root", ^{
            expect([hierarchySearcher topmostViewController]).to.equal(root);
        });
        it(@"should have nonmodal as root", ^{
            expect([hierarchySearcher topmostNonModalViewController]).to.equal(root);
        });
        it(@"should not have navigation", ^{
            expect([hierarchySearcher topmostNavigationController]).to.equal(nil);
        });
    });

    describe(@"with simple VC stack", ^{
        beforeEach(^{
            first = [[UIViewController alloc] init];
            second = [[UIViewController alloc] init];
            navVC = [[UINavigationController alloc] init];
            [[[UIApplication sharedApplication] keyWindow] setRootViewController:navVC];
            [navVC setViewControllers:@[first, second] animated:NO];
        });
        it(@"should have last one as top", ^{
            expect([hierarchySearcher topmostViewController]).to.equal(second);
        });
        it(@"should have last one as nonmodal", ^{
            expect([hierarchySearcher topmostNonModalViewController]).to.equal(second);
        });
        it(@"should have root as navigation", ^{
            expect([hierarchySearcher topmostNavigationController]).to.equal(navVC);
        });
    });

    describe(@"with simple presented stack", ^{
        beforeEach(^{
            first = [[UIViewController alloc] init];
            second = [[UIViewController alloc] init];
            root = [[[UIApplication sharedApplication] keyWindow] rootViewController];
            waitUntil(^(DoneCallback done) {
                [root presentViewController:first animated:NO completion:^{
                    [first presentViewController:second animated:NO completion:^{
                        done();
                    }];
                }];
            });
        });

        it(@"should have last one as top", ^{
            expect([hierarchySearcher topmostViewController]).will.equal(second);
        });
        it(@"should have root one as nonmodal", ^{
            expect([hierarchySearcher topmostNonModalViewController]).will.equal(root);
        });
        it(@"should have nothing as navigation", ^{
            expect([hierarchySearcher topmostNavigationController]).will.equal(nil);
        });
    });

    describe(@"with presented on top on pushed", ^{
        beforeEach(^{
            navVC = [[UINavigationController alloc] init];
            [[[UIApplication sharedApplication] keyWindow] setRootViewController:navVC];

            first = [[UIViewController alloc] init];
            second = [[UIViewController alloc] init];
            UIViewController *unimportant = [[UIViewController alloc] init];
            [navVC setViewControllers:@[unimportant, first] animated:NO];
            waitUntil(^(DoneCallback done) {
                // Just giving previous call some time
                done();
            });
            [first presentViewController:second animated:NO completion:nil];
        });

        it(@"should have presented one as top", ^{
            expect([hierarchySearcher topmostViewController]).will.equal(second);
        });
        it(@"should have one below presented as nonmodal", ^{
            expect([hierarchySearcher topmostNonModalViewController]).will.equal(first);
        });
        it(@"should have root as navigation", ^{
            expect([hierarchySearcher topmostNavigationController]).will.equal(navVC);
        });
    });

    describe(@"with pushed on top of presented", ^{
        beforeEach(^{
            first = [[UIViewController alloc] init];
            second = [[UIViewController alloc] init];
            UIViewController *unimportant = [[UIViewController alloc] init];
            navVC = [[UINavigationController alloc] init];
            [[[UIApplication sharedApplication] keyWindow] setRootViewController:first];

            [navVC setViewControllers:@[unimportant, second] animated:NO];
            waitUntil(^(DoneCallback done) {
                // Just giving previous call some time
                done();
            });
            [first presentViewController:navVC animated:NO completion:nil];
        });

        it(@"should have presented one as top", ^{
            expect([hierarchySearcher topmostViewController]).will.equal(second);
        });
        it(@"should have root as nonmodal", ^{
            expect([hierarchySearcher topmostNonModalViewController]).will.equal(first);
        });
        it(@"should have presented as navigation", ^{
            expect([hierarchySearcher topmostNavigationController]).will.equal(navVC);
        });
    });
});

SpecEnd
