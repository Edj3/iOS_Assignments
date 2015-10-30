//
//  SearchViewController.h
//  GameSmart
//
//  Created by Unbounded on 4/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameManager.h"
#import "JSONParser.h"
#import "DetailSearchViewController.h"

@interface SearchViewController : UIViewController <UITextFieldDelegate,UIAlertViewDelegate,UITableViewDelegate,UITableViewDataSource,NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UITableView *searchTable;

- (IBAction)testSave:(id)sender;

@end
