//
//  DetailViewController.h
//  Split View Exercise
//
//  Created by Unbounded on 4/3/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

//create text field outlets to be used to pass in user input to the Master Table View
@property (weak, nonatomic) IBOutlet UITextField *inputGenre;
@property (weak, nonatomic) IBOutlet UITextField *inputTitle;
@property (weak, nonatomic) IBOutlet UITextField *inputAuthor;
@property (weak, nonatomic) IBOutlet UITextField *inputPages;
@property (weak, nonatomic) IBOutlet UILabel *displayGenre;
@property (weak, nonatomic) IBOutlet UILabel *displayTitle;
@property (weak, nonatomic) IBOutlet UILabel *displayAuthor;
@property (weak, nonatomic) IBOutlet UILabel *displayPages;

@property (strong,nonatomic) UILabel *detailDescriptionLabel;
- (IBAction)btnBookAdd:(id)sender;

@end
