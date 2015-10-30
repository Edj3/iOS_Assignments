//
//  SearchViewController.h
//  MapExercise
//
//  Created by Unbounded on 4/23/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "JSONParser.h"

@interface SearchViewController : UIViewController <UITextFieldDelegate,UIAlertViewDelegate,NSXMLParserDelegate,NSURLConnectionDataDelegate>
@property (strong, nonatomic) IBOutlet UITextField *cityField;
@property (strong, nonatomic) IBOutlet UITextField *stateField;
@property (strong, nonatomic) NSString *userCity;
@property (strong, nonatomic) NSString *userState;
@property (strong, nonatomic) NSMutableString *myLat;
@property (strong, nonatomic) NSMutableString *myLng;
- (IBAction)searchForRestaurant:(id)sender;

@end
