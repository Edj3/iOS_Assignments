//
//  BAViewController.h
//  Book Assignment 1
//
//  Created by Unbounded on 3/30/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BAViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblGenre;
@property (weak, nonatomic) IBOutlet UILabel *lblAuthor;
@property (weak, nonatomic) IBOutlet UILabel *lblNumberOfPages;
- (IBAction)btnDone:(id)sender;

@end
