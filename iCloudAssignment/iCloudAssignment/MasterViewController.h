//
//  MasterViewController.h
//  iCloudAssignment
//
//  Created by Unbounded on 5/1/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
- (NSString*)newUntitledDocumentName;
@end
