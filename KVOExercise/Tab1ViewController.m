//
//  Tab1ViewController.m
//  KVOExercise
//
//  Created by Unbounded on 4/10/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "Tab1ViewController.h"
#import "Tab2ViewController.h"

@interface Tab1ViewController () <UITextFieldDelegate>

@end

@implementation Tab1ViewController

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
    self.field1Tab1.delegate = self;
    self.field2Tab1.delegate = self;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)switchToOn:(id)sender {
    Tab2ViewController *vc2 = [[self.tabBarController viewControllers]objectAtIndex:1];
    
    //vc2.display.text = self.field1Tab1.text;
    
    
    //Tab2ViewController *tab2 = [[mainTab viewControllers] objectAtIndex:1];
//    NSString *field1MessageName = @"getTab1Number";
//    NSString *key = @"parsedObject";
//    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:nil forKeys:key];
//    [[NSNotificationCenter defaultCenter]postNotificationName:field1MessageName object:nil userInfo:dictionary];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
@end
