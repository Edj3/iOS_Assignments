//
//  DictionaryDetailViewController.h
//  Navigation Exercise
//
//  Created by Unbounded on 4/2/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DictionaryTableViewController.h"
@interface DictionaryDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *wordKey;
@property (weak, nonatomic) IBOutlet UILabel *definition;

@end
