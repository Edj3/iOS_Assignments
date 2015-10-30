//
//  Tab1ViewController.h
//  KVOExercise
//
//  Created by Unbounded on 4/10/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tab1ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *field1Tab1;
@property (weak, nonatomic) IBOutlet UITextField *field2Tab1;
@property (weak, nonatomic) IBOutlet UISwitch *switchTab1;
- (IBAction)switchToOn:(id)sender;

@end
