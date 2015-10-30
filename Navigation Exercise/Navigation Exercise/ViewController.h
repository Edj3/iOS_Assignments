//
//  ViewController.h
//  Navigation Exercise
//
//  Created by Unbounded on 4/1/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "DictionaryTableViewController.h"

@interface ViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
