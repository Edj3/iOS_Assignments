//
//  AddBookViewController.h
//  CoreDataExercise
//
//  Created by Unbounded on 4/17/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddBookViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *enterBookTitle;
@property (weak, nonatomic) IBOutlet UITextField *enterBookAuthor;
@property (weak, nonatomic) IBOutlet UITextField *enterPageCount;
@property (weak, nonatomic) IBOutlet UITextField *enterGirlCount;
- (IBAction)addBookToCoreData:(id)sender;

@end
