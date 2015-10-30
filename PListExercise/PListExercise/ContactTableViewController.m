//
//  ContactTableViewController.m
//  PListExercise
//
//  Created by Unbounded on 4/18/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ContactTableViewController.h"

@interface ContactTableViewController ()
{
    NSArray *firstNameFromPlist;
    NSArray *lastNameFromPlist;
    NSArray *phoneFromPlist;
}
@end

@implementation ContactTableViewController
@synthesize firstNames,lastNames,phoneNumbers,contacts;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self readData];
    [self.tableView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.firstNames = [[NSMutableArray alloc]init];
    self.lastNames = [[NSMutableArray alloc]init];
    self.phoneNumbers = [[NSMutableArray alloc]init];
    self.firstAndLastNames= [[NSMutableArray alloc]init];
    self.contacts = [[NSMutableDictionary alloc]init];
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
    InputViewController *vc2 = [[InputViewController alloc]initWithNibName:@"InputViewController" bundle:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:vc2.ContactPlistNew];
    NSLog(@"Reading from : %@",vc2.ContactPlistNew);
    firstNameFromPlist = [dict valueForKey:@"First Name"];
    lastNameFromPlist = [dict valueForKey:@"Last Name"];
    phoneFromPlist = [dict valueForKey:@"Phone Number"];
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [self.contacts allKeys].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSArray *arrayOfNumbers = [self.contacts valueForKey:[self.firstAndLastNames objectAtIndex:section]];
    return arrayOfNumbers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ContactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
//    if (firstNames!=nil) {
//        cell.textLabel.text = [firstNameFromPlist objectAtIndex:indexPath.row];
//    }
    
    NSArray *arrayOfNumbers = [self.contacts valueForKey:[self.firstAndLastNames objectAtIndex:indexPath.section]];
    cell.textLabel.text = [arrayOfNumbers objectAtIndex:indexPath.row];
    //cell.detailTextLabel.text = [self.contacts objectForKey:[NSString stringWithFormat:@"%@ %@",self.fieldFirst.text,self.fieldLast.text]
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.firstAndLastNames objectAtIndex:section];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
