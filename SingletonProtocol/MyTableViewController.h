//
//  MyTableViewController.h
//  SingletonProtocol
//
//  Created by Unbounded on 4/11/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedResource.h"
#import "MyTableCell.h"

@interface MyTableViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
