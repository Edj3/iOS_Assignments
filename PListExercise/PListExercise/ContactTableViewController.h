//
//  ContactTableViewController.h
//  PListExercise
//
//  Created by Unbounded on 4/18/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputViewController.h"

@interface ContactTableViewController : UITableViewController
@property (strong, nonatomic) NSMutableArray *firstNames;
@property (strong, nonatomic) NSMutableArray *lastNames;
@property (strong, nonatomic) NSMutableArray *phoneNumbers;
@property (strong, nonatomic) NSDictionary *contacts;
@property (strong, nonatomic) NSMutableArray *firstAndLastNames;
@end
