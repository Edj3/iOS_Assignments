//
//  PageAppViewController.h
//  Page App
//
//  Created by Unbounded on 4/2/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageAppViewController : UIViewController
<UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@property (strong,nonatomic) NSArray *chapter;
@property (strong,nonatomic) NSArray *chapterText;
@property(strong,nonatomic) UIPageViewController *pageViewController;

@end
