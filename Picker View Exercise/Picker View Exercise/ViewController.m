//
//  ViewController.m
//  Picker View Exercise
//
//  Created by Unbounded on 4/4/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    int rowOf0;
    int rowOf1;
    int rowOf2;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.view.backgroundColor = [UIColor whiteColor];
    //self.pickerDateDisplay = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, 320, 216)];
    //self.pickerDateDisplay.center = self.view.center;
    //[self.pickerDateDisplay setDelegate:self];
    //[self.pickerDateDisplay setDataSource:self];
    //[self.view addSubview:self.pickerDateDisplay];
    
    //Initialize DatePicker and create it on the view with dimensions using CGRect
    self.myDatePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,250,320,216)];
    [self.view addSubview:self.myDatePicker];
    
    //Initialize text Label and center it and add it as a subview
    self.txtDate = [[UILabel alloc]initWithFrame:CGRectMake(0, 225, 300, 25)];
    [_txtDate setTextAlignment:UITextAlignmentCenter];
    self.txtDate.center = self.view.center;
    [self.view addSubview:self.txtDate];
    //[_txtDate setText:@"Date Goes Here"];
    
    //set up the date picker formatting to set up the txt label
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateStyle = NSDateFormatterMediumStyle;
    _txtDate.text = [NSString stringWithFormat:@"%@",[df stringFromDate:[NSDate date]]];
    
    _myDatePicker.datePickerMode = UIDatePickerModeDate;
    _myDatePicker.hidden = NO;
    _myDatePicker.date = [NSDate date];
    [self.myDatePicker addTarget:self
                      action:@selector(labelChange:) forControlEvents:UIControlEventValueChanged];
    
    NSLog(@"Date Objects Not Added Yet");
    //objects that don't work
  _column0Months = [[NSArray alloc]initWithObjects:@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December", nil];
    _column1days = [[NSMutableArray alloc]init];
    for (int i = 1; i <=31; i++) {
        [_column1days addObject:[NSNumber numberWithInt:i]];
    }
 // _column1days = [[NSArray alloc]initWithObjects:@"1",@"2",@"3", nil];
  _column2years = [[NSArray alloc]initWithObjects:@"2009",@"2010",@"2011",@"2012",@"2013", nil];
    
    NSLog(@"Date Objects Added");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
    NSLog(@"Created sections for picker view");
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [_column0Months count];
            break;
        case 1:
            return [_column1days count];
            break;
        case 2:
            return [_column2years count];
            break;
            
        default:
            break;
    }
    
    return [self.column1days count];
    //return 12;
NSLog(@"Created rows for the Picker view");
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [_column0Months objectAtIndex:row];
            break;
        case 1:
            return [[_column1days objectAtIndex:row] stringValue];
        case 2:
            return [_column2years objectAtIndex:row];
        default:
            break;
    }
    return [self.column0Months objectAtIndex:row];
   NSLog(@"Created titles for the rows in the picker view");
    return [NSString stringWithFormat:@"Comp %d, Row %d",component,row];
    //return [NSString stringWithFormat:@"Month"];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //    UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"Selection Made" message:[NSString stringWithFormat:@"Selected Comp %d, Row %d",component,row] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Not OK",@"Bad", nil];
    //    [myAlert show];
    switch (component) {
        case 0:
           rowOf0 = row;
            break;
        case 1:
            rowOf1 = row;
            break;
        case 2:
            rowOf2 = row;
            break;
            
        default:
            rowOf0 = 0;
            break;
    }
    
    
    NSLog(@"Set to Comp %d, Row %d",component,row);
}

-(void)labelChange:(id)sender
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateStyle = NSDateFormatterMediumStyle;
    self.txtDate.text = [NSString stringWithFormat:@"%@",[df stringFromDate:self.myDatePicker.date]];
}
@end
