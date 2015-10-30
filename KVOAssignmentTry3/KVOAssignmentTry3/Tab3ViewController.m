//
//  Tab3ViewController.m
//  KVOAssignmentTry3
//
//  Created by Unbounded on 4/14/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "Tab3ViewController.h"
#import "Tab4ViewController.h"
@interface Tab3ViewController ()
{
    int myDifference;
}

@end

@implementation Tab3ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.field1Tab3.delegate = self;
    self.field2Tab3.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)saveTab3:(id)sender {
    Tab4ViewController *vc4 = [[self.tabBarController viewControllers] objectAtIndex:3];
        myDifference = [self.field2Tab3.text intValue] - 7;
    //vc4.display2Tab4.text = @"7";
    if ([self.field2Tab3.text intValue]) {
        vc4.display2Tab4.text = [NSString stringWithFormat:@"%d - 7 = %d",[self.field2Tab3.text intValue],myDifference];
    }else{
        vc4.display2Tab4.text = @"Gotta add a # bro!";
    }
    NSLog(@"Updating Tab 4 Data...");
}


@end
