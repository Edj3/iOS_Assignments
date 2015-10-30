//
//  ViewController.m
//  GameSmart
//
//  Created by Unbounded on 4/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSTimer *timer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(pushSearchView) userInfo:nil repeats:NO];
}

-(void)pushSearchView{
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"TabBar"] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
