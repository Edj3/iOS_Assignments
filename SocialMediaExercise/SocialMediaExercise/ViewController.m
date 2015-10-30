//
//  ViewController.m
//  SocialMediaExercise
//
//  Created by Unbounded on 4/30/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImage *postImage;
    NSString *postText;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    postImage = [UIImage imageNamed:@"GameSmartLogo.png"];
    postText = @"Posting this from my new app boys and girls. ;)";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postToAny:(id)sender {
    //Set Up Activity View
    
    NSArray *activityItems = @[postText,postImage];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    
    [self presentViewController:activityController animated:YES completion:nil];
}

- (IBAction)postToFacebook:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        //Device is able to send Facebook Message
        SLComposeViewController *compose = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [compose setInitialText:postText];
        [compose addImage:postImage];
        [compose addURL:[NSURL URLWithString:@"http://facebook.com"]];
        
        [self presentViewController:compose animated:YES completion:nil];
    }
}

- (IBAction)postToTwitter:(id)sender {
    ACAccountStore *account = [[ACAccountStore alloc]init];
    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [account requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error){
        if (granted == YES) {
            NSArray *arrayOfAccounts = [account accountsWithAccountType:accountType];
            if ([arrayOfAccounts count] > 0) {
                ACAccount *twitterAccount = [arrayOfAccounts lastObject];
                NSDictionary *message = @{@"status": @"My First Twitter Post from iOS6"};
                NSURL *requestURL = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/update.json"];
                SLRequest *postRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodPOST URL:requestURL parameters:message];
                postRequest.account = twitterAccount;
                [postRequest performRequestWithHandler:^(NSData *responseData,NSHTTPURLResponse *urlResponse, NSError *error)
                {
                    NSLog(@"Twitter HTTP Response: %i",[urlResponse statusCode]);
                }];
            }
            
        }
    }];
    
    
    
}

- (IBAction)postToTwitterI5:(id)sender {
    if ([TWTweetComposeViewController canSendTweet]) {
        TWTweetComposeViewController *twitter = [[TWTweetComposeViewController alloc]init];
        NSString *string = @"Posting from iOS5... TWITTER TIME!";
        [twitter setInitialText:string];
        [twitter addImage:[UIImage imageNamed:@"GameSmartLogo.png"]];
        
        [self presentViewController:twitter animated:YES completion:nil];
        twitter.completionHandler = ^(TWTweetComposeViewControllerResult res){
            if (res == TWTweetComposeViewControllerResultDone) {
                NSLog(@"Tweet was posted baby!");
            }
            if (res == TWTweetComposeViewControllerResultCancelled){
                NSLog(@"Aww you cancelled bro...");
            }
            [self.modalViewController dismissModalViewControllerAnimated:YES];
        };
    }
}

@end
