//
//  ViewController.h
//  SettingsBundleExercise
//
//  Created by Unbounded on 4/21/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *field1;
@property (strong, nonatomic) IBOutlet UITextField *field2;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong,nonatomic) NSUserDefaults *defaults;

- (IBAction)SaveText:(id)sender;

@end
