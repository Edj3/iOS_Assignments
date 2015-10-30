//
//  HWViewController.m
//  HelloWorld
//
//  Created by Unbounded on 3/27/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "HWViewController.h"

@interface HWViewController ()

@end

@implementation HWViewController

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

- (IBAction)ShowMessage:(id)sender {
    NSString *string = [NSString stringWithString: _TextInput.text];
    [_display setText:string];
    NSLog(@"%@",@"Button Pressed");
    
}

@end
