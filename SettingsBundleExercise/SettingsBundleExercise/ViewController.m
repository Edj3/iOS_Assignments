//
//  ViewController.m
//  SettingsBundleExercise
//
//  Created by Unbounded on 4/21/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    float colorValue,colorValue2;
    BOOL switchValue,switchValue2;
}
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    colorValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"slider1"];
    colorValue2 = [[NSUserDefaults standardUserDefaults] floatForKey:@"slider2"];
    switchValue = [[NSUserDefaults standardUserDefaults] boolForKey:@"switch1"];
    switchValue2 = [[NSUserDefaults standardUserDefaults] boolForKey:@"switch2"];
    self.label1.text = [self.defaults objectForKey:@"field1"];
    self.label2.text = [self.defaults objectForKey:@"field2"];
    self.field1.text = [self.defaults objectForKey:@"field1"];
    self.field2.text = [self.defaults objectForKey:@"field2"];
    [self.label1 setTextColor:[UIColor colorWithRed:colorValue green:0 blue:0 alpha:1]];
    [self.label2 setTextColor:[UIColor colorWithRed:0 green:0 blue:colorValue2 alpha:1]];
    if (switchValue == NO) {
        [self.label1 setBackgroundColor:[UIColor greenColor]];
    }else{
        [self.label1 setBackgroundColor:[UIColor blueColor]];
    }
    if (switchValue2 == NO) {
        [self.label2 setBackgroundColor:[UIColor greenColor]];
    }else{
        [self.label2 setBackgroundColor:[UIColor redColor]];
    }
    
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
	[self customizeVC];
    [self initializeEverything];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SaveText:(id)sender {
    colorValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"slider1"];
    colorValue2 = [[NSUserDefaults standardUserDefaults] floatForKey:@"slider2"];
    switchValue = [[NSUserDefaults standardUserDefaults] boolForKey:@"switch1"];
    switchValue2 = [[NSUserDefaults standardUserDefaults] boolForKey:@"switch2"];
    self.label1.text = [self.defaults objectForKey:@"field1"];
    self.label2.text = [self.defaults objectForKey:@"field2"];
    self.field1.text = [self.defaults objectForKey:@"field1"];
    self.field2.text = [self.defaults objectForKey:@"field2"];
    [self.label1 setTextColor:[UIColor colorWithRed:colorValue green:0 blue:0 alpha:1]];
    [self.label2 setTextColor:[UIColor colorWithRed:0 green:0 blue:colorValue2 alpha:1]];
    if (switchValue == NO) {
        [self.label1 setBackgroundColor:[UIColor greenColor]];
    }else{
        [self.label1 setBackgroundColor:[UIColor blueColor]];
    }
    if (switchValue2 == NO) {
        [self.label2 setBackgroundColor:[UIColor greenColor]];
    }else{
        [self.label2 setBackgroundColor:[UIColor redColor]];
    }
}

-(void)customizeVC{
    [self.view setBackgroundColor:[UIColor grayColor]];
    self.field1.delegate = self;
    self.field2.delegate = self;
    [self.label1 setTextColor:[UIColor colorWithRed:colorValue green:0 blue:0 alpha:1]];
    [self.label2 setTextColor:[UIColor colorWithRed:0 green:0 blue:colorValue2 alpha:1]];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)initializeEverything{
    self.defaults = [[NSUserDefaults alloc]init];
    [self.label1 setTextColor:[UIColor colorWithRed:colorValue green:0 blue:0 alpha:1]];
    [self.label2 setTextColor:[UIColor colorWithRed:0 green:0 blue:colorValue2 alpha:1]];
    if (switchValue == NO) {
        [self.label1 setBackgroundColor:[UIColor greenColor]];
    }else{
        [self.label1 setBackgroundColor:[UIColor blueColor]];
    }
    if (switchValue2 == NO) {
        [self.label2 setBackgroundColor:[UIColor greenColor]];
    }else{
        [self.label2 setBackgroundColor:[UIColor redColor]];
    }
}
@end
