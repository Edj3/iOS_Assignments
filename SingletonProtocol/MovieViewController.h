//
//  MovieViewController.h
//  SingletonProtocol
//
//  Created by Unbounded on 4/11/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedResource.h"
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
