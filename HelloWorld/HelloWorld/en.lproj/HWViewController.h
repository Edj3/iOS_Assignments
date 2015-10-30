//
//  HWViewController.h
//  HelloWorld
//
//  Created by Unbounded on 3/27/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UITextField *TextInput;
- (IBAction)ShowMessage:(id)sender;


@end
