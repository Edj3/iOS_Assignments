//
//  MovieViewController.h
//  SingletonAssignment
//
//  Created by Unbounded on 4/12/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

//create protocols for the delegate to accept movies
//@protocol MovieDelegate <NSObject>
//@required
//-(void)getMovie;
//@end

@interface MovieViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *movieInput;
@property (weak, nonatomic) IBOutlet UITextField *yearInput;
@property (weak, nonatomic) IBOutlet UITextView *castInput;
- (IBAction)popToRoot:(id)sender;
@end
