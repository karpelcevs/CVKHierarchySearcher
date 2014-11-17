# CVKHierarchySearcher

[![CI Status](http://img.shields.io/travis/coverback/CVKHierarchySearcher.svg?style=flat)](https://travis-ci.org/coverback/CVKHierarchySearcher)
[![Version](https://img.shields.io/cocoapods/v/CVKHierarchySearcher.svg?style=flat)](http://cocoadocs.org/docsets/CVKHierarchySearcher)
[![License](https://img.shields.io/cocoapods/l/CVKHierarchySearcher.svg?style=flat)](http://cocoadocs.org/docsets/CVKHierarchySearcher)
[![Platform](https://img.shields.io/cocoapods/p/CVKHierarchySearcher.svg?style=flat)](http://cocoadocs.org/docsets/CVKHierarchySearcher)

CVKHierarchySearcher is a small utility class to go through the view controller hierarchy of an iOS app
and retrieve often needed topmost view controllers. Right now it provides the topmost, topmost non-modal and 
topmost `UINavigationController`.

## Usage

Using it is very simple. Just instantiate the object whenever you need it and ask for a specified
view controller:

```objective-c
CVKHierarchySearcher *hierarchy = [[CVKHierarchySearcher alloc] init];
UIViewController *topmost = hierarchy.topmostViewController;
```

Class relies on `-[UIApplicationDelegate window]`, and if that fails, uses `-[UIApplication keyWindow]`.
This worked for me, but if this needs another fallback for some kinds of apps, let me know.

For mocking purposes, `CVKHierarchySearcher` implements a protocol `ViewControllerHierarchy` rather than just provides all the methods as is. For the same purpose methods are on instance, not class. While this makes a
drop-in usage a tiny bit more complicated, it allows much easier testing than having to deal with classes actually showing new controllers on top of whatever they want.

For a way to easily inject this object and utilise the interface-only approach, see [`CVKInjector`](https://github.com/coverback/CVKInjector).

## Requirements

iOS 7 and up. I'm using and testing this on iOS 7+, but if anyone can test and needs this on iOS 6, please
submit a PR.

## Installation

CVKHierarchySearcher is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'CVKHierarchySearcher'

## Author

Romans Karpelcevs, karpelcev@gmail.com

## License

CVKHierarchySearcher is available under the MIT license. See the LICENSE file for more info.

