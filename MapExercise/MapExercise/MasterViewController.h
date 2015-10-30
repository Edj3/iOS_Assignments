//
//  MasterViewController.h
//  MapExercise
//
//  Created by Unbounded on 4/23/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"
#import "MyManager.h"
#import "myAnnotation.h"
#import "JSONParser.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController 

@property (strong, nonatomic) DetailViewController *detailViewController;
//@property (strong, nonatomic) SearchViewController *svc;


@end
