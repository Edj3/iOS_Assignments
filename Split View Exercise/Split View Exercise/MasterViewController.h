//
//  MasterViewController.h
//  Split View Exercise
//
//  Created by Unbounded on 4/3/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController
{
    NSMutableArray *myGenres;
    NSMutableArray *myHorrorBooks;
    NSMutableArray *myRomComBooks;
    NSMutableArray *myBadMusic;
    NSMutableArray *myRows;
}
@property (strong,nonatomic) NSMutableArray *myTableArray;
@property (strong, nonatomic) DetailViewController *detailViewController;

@end
