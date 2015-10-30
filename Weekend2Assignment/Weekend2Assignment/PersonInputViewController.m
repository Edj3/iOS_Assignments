//
//  PersonInputViewController.m
//  Weekend2Assignment
//
//  Created by Unbounded on 4/6/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "PersonInputViewController.h"
#import "PersonDetailViewController.h"
#import "Person.h"
#import "sqlite3.h"
#import "Database.h"

@interface PersonInputViewController ()
{
    Database *personDB;
    NSString *dbPathString;
    NSArray *existingPerson;
}

@end

@implementation PersonInputViewController
//{
    //MyManager *shareStuff;
//}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setDelegates];
    [self initializeInputData];
    [self initAndLoadFromDatabase];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPerson:(id)sender {
    
    UINavigationController *nav = [[self.tabBarController viewControllers]objectAtIndex:0];
    PersonTableViewController *ptv = [[nav viewControllers]objectAtIndex:0];
    //create date formatter
    NSDateFormatter *df =[[NSDateFormatter alloc]init];
    df.dateStyle = NSDateFormatterShortStyle;
    //MyManager *sr = [MyManager getMyManager];
    //[[sr myGlobalDictionary]initWithCapacity:5];
    //[[sr myGlobalDictionary] setValue:[_myDepartArray objectAtIndex:0] forKey:@"HR"];
    //[[sr myGlobalDictionary] setValue:[_myDepartArray objectAtIndex:1] forKey:@"Management"];
    //[[sr myGlobalDictionary] setValue:[_myDepartArray objectAtIndex:2] forKey:@"Consulting"];
    //[[sr myGlobalDictionary] setValue:[_myDepartArray objectAtIndex:3] forKey:@"IT"];
    //[[sr myGlobalDictionary] setValue:[_myDepartArray objectAtIndex:4] forKey:@"Accounting"];
    
    NSString *stringKey = [self.myDepartArray objectAtIndex:[_myDepartPicker selectedRowInComponent:0]];
    NSLog(@"%@",stringKey);
    
    ptv.pAdd = [[Person alloc]initWithFirstName:_firstName.text WithMiddleName:_midName.text WithLastName:_lastName.text WithDepartment:stringKey WithDOB:[df stringFromDate:_myDatePicker.date]];
    
    [personDB savePerson:ptv.pAdd toDatabasePath:dbPathString];
    ///check in my dictionary if the key is there
    //if yes get the value for that key
    // value is a mutablearray and add new person to that array.
    // set the value for the key
    //if the key i not there
    //add a new key and value as nsmutable array with one person object
    
    if ([stringKey isEqualToString:@"HR"])
    {
        if ([ptv.departmentCollect objectForKey:@"HR"]) {
            [[ptv.departmentCollect objectForKey:@"HR"] addObject:ptv.pAdd];
        }
        else {
            NSMutableArray *elsePeople = [[NSMutableArray alloc]init];
            [elsePeople addObject:ptv.pAdd];
            [ptv.departmentCollect setObject:elsePeople forKey:@"HR"];
        }
    }
    if ([stringKey isEqualToString:@"Management"])
    {
        [ptv.peopleArrayMan addObject:ptv.pAdd];
        if ([ptv.departmentCollect objectForKey:@"Management"]) {
            
            [[ptv.departmentCollect objectForKey:@"Management"] addObject:ptv.pAdd];
        }
        else {
            NSMutableArray *elsePeople = [[NSMutableArray alloc]init];
            [elsePeople addObject:ptv.pAdd];
            [ptv.departmentCollect setObject:elsePeople forKey:@"Management"];
        }
    }
    if ([stringKey isEqualToString:@"Consulting"])
    {
        [ptv.peopleArrayCon addObject:ptv.pAdd];
        if ([ptv.departmentCollect objectForKey:@"Consulting"]) {
            
            [[ptv.departmentCollect objectForKey:@"Consulting"] addObject:ptv.pAdd];
        }
        else {
            NSMutableArray *elsePeople = [[NSMutableArray alloc]init];
            [elsePeople addObject:ptv.pAdd];
            [ptv.departmentCollect setObject:elsePeople forKey:@"Consulting"];
        }
    }
    if ([stringKey isEqualToString:@"IT"]) {
        [ptv.peopleArrayIT addObject:ptv.pAdd];
        if ([ptv.departmentCollect objectForKey:@"IT"]) {
            
            [[ptv.departmentCollect objectForKey:@"IT"] addObject:ptv.pAdd];
        }
        else {
            NSMutableArray *elsePeople = [[NSMutableArray alloc]init];
            [elsePeople addObject:ptv.pAdd];
            [ptv.departmentCollect setObject:elsePeople forKey:@"IT"];
        }
    }
    if ([stringKey isEqualToString:@"Accounting"])
    {
        [ptv.peopleArrayAcc addObject:ptv.pAdd];
        if ([ptv.departmentCollect objectForKey:@"Accounting"]) {
            
            [[ptv.departmentCollect objectForKey:@"Accounting"] addObject:ptv.pAdd];
        }
        else {
            NSMutableArray *elsePeople = [[NSMutableArray alloc]init];
            [elsePeople addObject:ptv.pAdd];
            [ptv.departmentCollect setObject:elsePeople forKey:@"Accounting"];
        }
        
    }
    
    NSLog(@"You just added a person");
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
    NSLog(@"Created Sections in Picker View");
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_myDepartArray count];
    NSLog(@"Created Rows in Picker View");
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component 
{
    return [_myDepartArray objectAtIndex:row];
    NSLog(@"Generated titles in each row of picker view");
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"Added Department");
    
}

#pragma SQL Open and Read In on InputController

-(void)initAndLoadFromDatabase{
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPathString = [docPath stringByAppendingPathComponent:@"person.sqlite"];
    NSString* makeTable = @"CREATE TABLE IF NOT EXISTS Person (firstname TEXT, middlename TEXT, lastname TEXT, department TEXT, dob TEXT)";
    
    personDB = [[Database alloc]initWithDatabasePath:dbPathString WithSQLStatement:makeTable];
    existingPerson = [personDB readDataFromPath:dbPathString];
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)setDelegates{
    self.firstName.delegate = self;
    self.lastName.delegate = self;
    self.midName.delegate = self;
}

-(void)initializeInputData{
    UINavigationController *nav = [[self.tabBarController viewControllers]objectAtIndex:0];
    PersonTableViewController *ptv = [[nav viewControllers]objectAtIndex:0];
    self.myDepartArray = [[NSArray alloc]initWithObjects:@"HR",@"Management",@"Consulting",@"IT",@"Accounting",nil];
    ptv.peopleArrayHR = [[NSMutableArray alloc]init];
    ptv.peopleArrayCon = [[NSMutableArray alloc]init];
    ptv.peopleArrayMan = [[NSMutableArray alloc]init];
    ptv.peopleArrayIT = [[NSMutableArray alloc]init];
    ptv.peopleArrayAcc = [[NSMutableArray alloc]init];
    
    //create date formatter
    NSDateFormatter *df =[[NSDateFormatter alloc]init];
    df.dateStyle = NSDateFormatterShortStyle;
    //NSString *date = [NSString stringWithFormat:@"%@",[df stringFromDate:self.myDatePicker.date]];
    
    
    
    NSLog(@"Table Array Made");
}
//-(void)saveRecord{
//    UINavigationController *nav = [[self.tabBarController viewControllers]objectAtIndex:0];
//    PersonTableViewController *ptv = [[nav viewControllers]objectAtIndex:0];
//}

@end
