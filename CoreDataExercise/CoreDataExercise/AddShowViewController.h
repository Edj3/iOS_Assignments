//
//  AddShowViewController.h
//  CoreDataExercise
//
//  Created by Unbounded on 4/17/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddShowViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *enterShowTitle;
@property (weak, nonatomic) IBOutlet UITextField *enterMainCharacter;
@property (weak, nonatomic) IBOutlet UITextField *enterSeason;
@property (weak, nonatomic) IBOutlet UISegmentedControl *showSegment;
- (IBAction)isShowAiring:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *airDisplay;

@end
