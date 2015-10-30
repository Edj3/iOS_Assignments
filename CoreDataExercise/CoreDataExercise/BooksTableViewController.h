//
//  BooksTableViewController.h
//  CoreDataExercise
//
//  Created by Unbounded on 4/17/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BooksTableViewController : UITableViewController
@property (strong,nonatomic) NSManagedObjectContext *bookManagedObjectContext;
@property (strong,nonatomic) NSFetchedResultsController *fetchedResultsController;
@end
