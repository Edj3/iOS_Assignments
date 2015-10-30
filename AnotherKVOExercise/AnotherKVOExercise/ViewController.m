//
//  ViewController.m
//  AnotherKVOExercise
//
//  Created by Unbounded on 4/12/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewController.h"

@interface ViewController ()
{
    NSTimer *myTimer;
}
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self.navigationItem setTitle:@"Timer for KVO"];
}

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

- (IBAction)startTimer:(id)sender {
    MyTableViewController *vc2 = [[MyTableViewController alloc]initWithNibName:@"MyTableViewController" bundle:nil];
    [[self navigationController] pushViewController:vc2 animated:YES];
    myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateArray:) userInfo:nil repeats:YES];
    NSString *string =  @"Item";
    NSNumber *randnum = [[NSNumber alloc]initWithInt:arc4random() % 500];
    [self.myArray addObject:[string stringByAppendingString:[randnum stringValue]]];
}

-(void)updateArray
{
    
    
    
}
@end
