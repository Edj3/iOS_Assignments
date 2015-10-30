//
//  ViewController.h
//  SocialMediaExercise
//
//  Created by Unbounded on 4/30/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *postFacebook;
@property (weak, nonatomic) IBOutlet UIButton *postTwitter;
@property (weak, nonatomic) IBOutlet UIButton *postTwitterI5;

- (IBAction)postToAny:(id)sender;
- (IBAction)postToFacebook:(id)sender;
- (IBAction)postToTwitter:(id)sender;
- (IBAction)postToTwitterI5:(id)sender;



@end
