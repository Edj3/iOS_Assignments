//
//  Tab3ViewController.h
//  KVOAssignmentTry3
//
//  Created by Unbounded on 4/14/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tab4ViewController.h"

@interface Tab3ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *field1Tab3;
@property (weak, nonatomic) IBOutlet UITextField *field2Tab3;
- (IBAction)saveTab3:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveTab3;

@end
