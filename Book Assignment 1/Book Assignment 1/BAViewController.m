//
//  BAViewController.m
//  Book Assignment 1
//
//  Created by Unbounded on 3/30/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "BAViewController.h"

@interface BAViewController ()

@end

@implementation BAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnDone:(id)sender {
    if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)])
    {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
    else
    {
        [self dismissModalViewControllerAnimated:YES];
    }
}
@end
