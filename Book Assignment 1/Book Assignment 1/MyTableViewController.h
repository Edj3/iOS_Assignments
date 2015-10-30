//
//  MyTableViewController.h
//  Book Assignment 1
//
//  Created by Unbounded on 3/30/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BACell.h"
#import "BABook.h"
#import "BAViewController.h"

@interface MyTableViewController : UITableViewController
{
    NSMutableArray *myTableArray;
    NSMutableArray *myGenres;
    NSMutableArray *myHorrorBooks;
    NSMutableArray *myRomComBooks;
    NSMutableArray *myBadMusic;
    NSMutableArray *myRows;
}

@end
