//
//  PersonInputViewController.h
//  Weekend2Assignment
//
//  Created by Unbounded on 4/6/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonDetailViewController.h"
#import "PersonTableViewController.h"
#import "Person.h"
#import "sqlite3.h"

@interface PersonInputViewController : UIViewController
<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *midName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UIPickerView *myDepartPicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (strong,nonatomic) NSArray *myDepartArray;
//@property (strong,nonatomic) PersonDetailViewController *myPersonDetailViewCon;
- (IBAction)addPerson:(id)sender;

@end
