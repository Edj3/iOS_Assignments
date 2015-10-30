//
//  ViewController.m
//  KVOAssignmentTry3
//
//  Created by Unbounded on 4/14/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"
#import "Tab2ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.field1Tab1.delegate = self;
    self.field2Tab1.delegate = self;
    self.myNewSwitch = [[UISwitch alloc]init];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchTab1:(id)sender {
    
    [self.myNewSwitch setOn:self.switchTab1.on];
    [self postNotificationNumRows:@"numberYourRows"];
    [self postNotificationCheckSelected:@"checkSelected"];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)postNotificationNumRows:(NSString*)data
{
    NSDictionary *tab1Info = [NSDictionary dictionaryWithObject:self forKey:@"pass"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"vc1pass" object:nil userInfo:tab1Info];
}

-(void)postNotificationCheckSelected:(NSString*)data{
    NSDictionary *tab1Status = [NSDictionary dictionaryWithObject:self forKey:@"tab1pass"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"vc1checkselect" object:nil userInfo:tab1Status];
}
@end
