//
//  ScrollViewController.h
//  Weekend2Assignment
//
//  Created by Unbounded on 4/6/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (strong, nonatomic) IBOutlet UIImageView *image1;
@property (strong,nonatomic) IBOutlet UIImageView *image2;
@property (strong,nonatomic) IBOutlet UIImageView *image3;
@property (strong,nonatomic) IBOutlet UIImageView *image4;
@property (strong, nonatomic) IBOutlet UIImageView *image5;
@property (strong, nonatomic) NSMutableArray *imageViewCollection;
@property (strong, nonatomic) UIPageControl *myPageControl;
- (IBAction)addImage:(id)sender;
- (IBAction)deleteImage:(id)sender;
-(IBAction) changePage: (UIPageControl*) sender;
@end
