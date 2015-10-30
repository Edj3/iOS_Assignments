//
//  ViewController.h
//  ScrollViewFun
//
//  Created by Unbounded on 4/2/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *myImageView;


@end
