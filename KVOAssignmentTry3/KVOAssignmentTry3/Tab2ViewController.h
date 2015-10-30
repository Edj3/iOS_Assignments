//
//  Tab2ViewController.h
//  KVOAssignmentTry3
//
//  Created by Unbounded on 4/14/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface Tab2ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet UILabel *displayTab2;
- (IBAction)switchTab2:(id)sender;
@property (strong, nonatomic) IBOutlet UISwitch *switchTab2;

@end
