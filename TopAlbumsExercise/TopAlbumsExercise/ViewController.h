//
//  ViewController.h
//  TopAlbumsExercise
//
//  Created by Unbounded on 4/15/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,NSURLConnectionDataDelegate,NSXMLParserDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegment;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)parserSelect:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end
