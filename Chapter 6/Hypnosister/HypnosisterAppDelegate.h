//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Thomas Kimura on 2013-10-14.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisterView.h"

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>
{
    HypnosisterView *view;
}

@property (strong, nonatomic) UIWindow *window;

@end
