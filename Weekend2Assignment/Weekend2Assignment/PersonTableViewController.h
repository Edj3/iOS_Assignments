//
//  PersonTableViewController.h
//  Weekend2Assignment
//
//  Created by Unbounded on 4/5/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonDetailViewController.h"
#import "PersonInputViewController.h"
#import "PersonCell.h"
#import "Person.h"
#import "sqlite3.h"
#import "Database.h"

@interface PersonTableViewController : UITableViewController <UIAlertViewDelegate,UIPickerViewDelegate>

@property (strong,nonatomic) NSMutableArray *myTableArray;
@property (strong,nonatomic) NSArray *personAdd;
@property (strong,nonatomic) PersonDetailViewController *myPersonDetailView;
@property (strong,nonatomic) NSIndexPath *segueIndex;
@property (strong,nonatomic) NSMutableDictionary *departmentCollect;
@property (strong,nonatomic) Person *pAdd;
@property (strong,nonatomic) NSMutableArray *peopleArrayHR;
@property (strong,nonatomic) NSMutableArray *peopleArrayMan;
@property (strong,nonatomic) NSMutableArray *peopleArrayCon;
@property (strong,nonatomic) NSMutableArray *peopleArrayIT;
@property (strong,nonatomic) NSMutableArray *peopleArrayAcc;

@end
