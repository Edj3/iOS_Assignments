//
//  Tab4ViewController.h
//  KVOAssignmentTry3
//
//  Created by Unbounded on 4/14/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tab3ViewController.h"

@interface Tab4ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *display1Tab4;
@property (strong, nonatomic) IBOutlet UILabel *display2Tab4;
- (IBAction)switchTab4:(id)sender;
@property (strong, nonatomic) IBOutlet UISwitch *switchTab4;

@end
