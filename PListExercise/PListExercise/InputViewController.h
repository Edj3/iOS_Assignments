//
//  InputViewController.h
//  PListExercise
//
//  Created by Unbounded on 4/18/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactTableViewController.h"

@interface InputViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *fieldFirst;
@property (strong, nonatomic) IBOutlet UITextField *fieldLast;
@property (strong, nonatomic) IBOutlet UITextView *viewPhones;
@property (strong, nonatomic) IBOutlet UIButton *saveContact;
@property (strong, nonatomic) NSString *ContactPlistNew;
@property (strong, nonatomic) NSMutableArray *firstAndLastNames;
@property (strong, nonatomic) NSMutableDictionary *contacts;

- (IBAction)saveContact:(id)sender;

@end
