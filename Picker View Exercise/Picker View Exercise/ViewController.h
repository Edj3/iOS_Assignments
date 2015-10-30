//
//  ViewController.h
//  Picker View Exercise
//
//  Created by Unbounded on 4/4/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *pickerDateDisplay;
@property (strong,nonatomic) IBOutlet NSArray *column0Months;
@property (strong,nonatomic) IBOutlet NSMutableArray *column1days;
@property (strong,nonatomic) IBOutlet NSArray *column2years;
@property (strong, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (retain,nonatomic) IBOutlet UILabel *txtDate;
@end
