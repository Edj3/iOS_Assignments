//
//  ViewController.m
//  Picker Test Exercise
//
//  Created by Unbounded on 4/4/13.
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
    self.view.backgroundColor = [UIColor whiteColor];
    self.myPicker = [[UIPickerView alloc]init];
    //[_myPicker setDataSource:self];
    //[_myPicker setDelegate:self];
    //self.myPicker.center = self.view.center;
    //[self.view addSubview:self.myPicker];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSInteger result = 0;
    if([pickerView isEqual:_myPicker])
    {
        result = 1;
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger result = 0;
    if([pickerView isEqual:_myPicker])
    {
        result = 10;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *result = nil;
    if([pickerView isEqual:_myPicker])
    {
        result = [NSString stringWithFormat:@"Row%d",row];
    }
    return result;
}

@end
