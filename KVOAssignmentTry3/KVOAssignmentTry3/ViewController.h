//
//  ViewController.h
//  KVOAssignmentTry3
//
//  Created by Unbounded on 4/14/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *field1Tab1;
@property (weak, nonatomic) IBOutlet UITextField *field2Tab1;
- (IBAction)switchTab1:(id)sender;
@property (strong, nonatomic) IBOutlet UISwitch *switchTab1;
@property (strong,nonatomic) UISwitch *myNewSwitch;
@end
