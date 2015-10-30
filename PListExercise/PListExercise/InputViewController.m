//
//  InputViewController.m
//  PListExercise
//
//  Created by Unbounded on 4/18/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()
{
    NSString *contactsFile;
}

@end

@implementation InputViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //[self readData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setDelegates];
    self.ContactPlistNew = [[NSString alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)readData
{
    //stores the path of the plist file present in the bundle
    //NSString *bundlePathofPlist = [[NSBundle mainBundle]pathForResource:@"Contacts" ofType:@"plist"];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:self.ContactPlistNew];
    NSLog(@"Reading from : %@",self.ContactPlistNew);
    NSArray *firstNameFromPlist = [dict valueForKey:@"First Name"];
    NSArray *lastNameFromPlist = [dict valueForKey:@"Last Name"];
    NSArray *phoneFromPlist = [dict valueForKey:@"Phone Number"];
    
    for(int i =0;i<[firstNameFromPlist count];i++)
    {
        NSLog(@"First Name no %d is %@",i+1,[firstNameFromPlist objectAtIndex:i]);
    }
    for(int i =0;i<[lastNameFromPlist count];i++)
    {
        NSLog(@"Last Name no %d is %@",i+1,[lastNameFromPlist objectAtIndex:i]);
    }
    for(int i =0;i<[phoneFromPlist count];i++)
    {
        NSLog(@"Phone no %d is %@",i+1,[phoneFromPlist objectAtIndex:i]);
    }
}


- (IBAction)saveContact:(id)sender {
    ContactTableViewController *vc1 = [self.navigationController.viewControllers objectAtIndex:0];
    
    
    //Create copy of plist to add to
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    //the below variable is an instance of the NSString class and is declared inteh .h file
    self.ContactPlistNew = [documentFolder stringByAppendingPathComponent:@"NewPlist.plist"];
    
    NSString *bundleFile = [[NSBundle mainBundle]pathForResource:@"Contacts" ofType:@"plist"];
    
    
    //copy the file from the bundle to the doc directory
    [[NSFileManager defaultManager]copyItemAtPath:bundleFile toPath:self.ContactPlistNew error:nil];
    NSLog(@"Writing to : %@",self.ContactPlistNew);
    
    NSMutableDictionary *addData = [NSMutableDictionary dictionaryWithContentsOfFile:self.ContactPlistNew];
    
    NSString *viewPhoneNumbers = self.viewPhones.text;
    NSArray *breakPhones = [viewPhoneNumbers componentsSeparatedByString:@","];
    
    [vc1.firstAndLastNames addObject:[NSString stringWithFormat:@"%@ %@",self.fieldFirst.text,self.fieldLast.text]];
    [vc1.contacts setValue:[NSMutableArray arrayWithArray:breakPhones] forKey:[NSString stringWithFormat:@"%@ %@",self.fieldFirst.text,self.fieldLast.text]];
    
    //finally saving the changes made to the file
    [addData writeToFile:self.ContactPlistNew atomically:YES];
    
    //Navigating to first array
//    NSString *bundlePathofPlist = [[NSBundle mainBundle]pathForResource:@"Contacts" ofType:@"plist"];
    
//    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:self.ContactPlistNew];
//    NSLog(@"Reading from : %@",self.ContactPlistNew);
//    NSArray *firstNameFromPlist = [dict valueForKey:@"First Name"];
//    NSArray *lastNameFromPlist = [dict valueForKey:@"Last Name"];
//    NSArray *phoneFromPlist = [dict valueForKey:@"Phone Number"];
    
    NSArray *newFirstName = [[NSArray alloc]initWithObjects:self.fieldFirst.text, nil];
    NSArray *newLastName = [[NSArray alloc]initWithObjects:self.fieldLast.text, nil];
    NSArray *newPhoneNumber = [[NSArray alloc]initWithObjects:self.viewPhones, nil];
    
    //adding the new objects to the plist
    [addData setObject:newFirstName forKey:@"First Name"];
    [addData setObject:newLastName forKey:@"Last Name"];
    [addData setObject:newPhoneNumber forKey:@"Phone Number"];
    
//    //Add input to appropriate keys in Plist
//    [vc1.firstNames addObject:self.fieldFirst.text];
//    [vc1.lastNames addObject:self.fieldLast.text];
//    [vc1.phoneNumbers addObject:self.viewPhones.text];
    NSLog(@"Saved new Contact!");
    [self readData];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

-(void) setDelegates{
    self.fieldFirst.delegate = self;
    self.fieldLast.delegate = self;
    self.viewPhones.delegate = self;
}
@end
