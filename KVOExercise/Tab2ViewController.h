//
//  Tab2ViewController.h
//  KVOExercise
//
//  Created by Unbounded on 4/10/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tab2ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
