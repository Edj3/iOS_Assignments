//
//  ViewController.m
//  ScrollViewFun
//
//  Created by Unbounded on 4/2/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *imageToLoad = [UIImage imageNamed:@"Pezreal.jpg"];
    _myImageView = [[UIImageView alloc]initWithImage:imageToLoad];
    _myScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
   [self.myScrollView addSubview:self.myImageView];
    self.myScrollView.contentSize = self.myImageView.bounds.size;
    [self.view addSubview:self.myScrollView];
    
    //default iphone frame dimensions are width of 320 pixels and length of 460 pixels!
    self.myScrollView.frame = CGRectMake(10,10,300, 440);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
@end
