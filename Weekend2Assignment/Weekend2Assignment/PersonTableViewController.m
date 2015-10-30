//
//  PersonTableViewController.m
//  Weekend2Assignment
//
//  Created by Unbounded on 4/5/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "PersonTableViewController.h"
#import "PersonDetailViewController.h"

@interface PersonTableViewController ()
{
    //MyManager *shareManage;
    //used for dictionary management on prior exercise
    NSMutableArray *departCount;
    NSArray *arrayOfSectionHeaders;
    NSInteger sections;
    NSInteger rows;
    NSMutableArray *departments;
    NSMutableArray *firstNames;
    NSMutableArray *LastNames;
    Database *personDB;
    NSString *dbPathString;
    NSArray *existingPerson;
    NSNumber *databaseCount;
}

@end

@implementation PersonTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated
{
    
    [self.tableView reloadData];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //initialize table array as an empty array to be added to later on.
    self.myTableArray = [[NSMutableArray alloc]init];
    self.departmentCollect = [[NSMutableDictionary alloc]init];
    self.pAdd = [[Person alloc]init];
    arrayOfSectionHeaders = @[@"HR",@"Management",@"Consulting",@"IT",@"Accounting"];
    existingPerson = [[NSArray alloc]init];
    //MyManager *sr = [MyManager getMyManager];
    //_myTableArray = [sr myGlobalArray];
    //departCount = [sr myGlobalArray];
    //_departmentCollect = [sr myGlobalDictionary];
    [self initAndLoadFromDatabase];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
        return arrayOfSectionHeaders.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSString *key = [arrayOfSectionHeaders objectAtIndex:section];
    NSMutableArray *array = [self.departmentCollect objectForKey:key];
    NSLog(@"rows: %d for section: %d",array.count, section);
    //return [existingPerson count];
    return array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PersonCell";
    PersonCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[PersonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *key =[arrayOfSectionHeaders objectAtIndex:indexPath.section];
    //set the text of each label in the cell equal to what's in the indexpath of the object
    cell.cellFirst.text = [[[self.departmentCollect objectForKey:key]objectAtIndex:indexPath.row]personFirst];
    cell.cellLast.text = [[[self.departmentCollect objectForKey:key]objectAtIndex:indexPath.row]personLast];
    //cell.cellFirst.text = [[existingPerson objectAtIndex:indexPath.row] personFirst];
    //cell.cellLast.text = [[existingPerson objectAtIndex:indexPath.row] personLast];
    NSLog(@"Your cell has been generated!");
    // Configure the cell...
    return cell;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if([[self.departmentCollect allKeys]count]>0 && [[self.departmentCollect objectForKey:[arrayOfSectionHeaders objectAtIndex:section]]count]>0){
        return [arrayOfSectionHeaders objectAtIndex:section];
    }
    else{
        return 0;
    }
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            // Delete the row from the data source
            UIAlertView *myMessage = [[UIAlertView alloc]initWithTitle:@"Deleting Cell..." message:@"Are you sure you want to delete this person?" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"YES", nil];
            myMessage.delegate = self;
            //save sections and rows to be used in special delegate function for alert view below
            sections = indexPath.section;
            rows = indexPath.row;
            [myMessage show];
        }
        else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

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
    PersonDetailViewController *personDetailVC =[[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil]instantiateViewControllerWithIdentifier:@"detailVC"];
    NSString *key =[arrayOfSectionHeaders objectAtIndex:indexPath.section];
    personDetailVC.collectPerson =[[self.departmentCollect valueForKey:key]objectAtIndex:indexPath.row];
    [[self navigationController]pushViewController:personDetailVC animated:YES];
    NSLog(@"Labels on next page should be added");
    
    //take the index path from the table view to be used in the segue function below. This must be done because the segue function does not take in the indexPath as a value itself
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"YES"]) {
        NSString *key =[arrayOfSectionHeaders objectAtIndex:sections];
        [personDB deletePerson:[[self.departmentCollect objectForKey:key]objectAtIndex:rows] fromDatabasePath:dbPathString];
        [[self.departmentCollect objectForKey:key]removeObjectAtIndex:rows];
        [self.tableView reloadData];
    }
}

-(void)initAndLoadFromDatabase{
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPathString = [docPath stringByAppendingPathComponent:@"person.sqlite"];
    NSString* makeTable = @"CREATE TABLE IF NOT EXISTS Person (firstname TEXT, middlename TEXT, lastname TEXT, department TEXT, dob TEXT)";
    
    personDB = [[Database alloc]initWithDatabasePath:dbPathString WithSQLStatement:makeTable];
    existingPerson = [personDB readDataFromPath:dbPathString];
    NSLog(@"Existing person count %d",existingPerson.count);
    //NSLog(@"%@ %@",[[existingPerson objectAtIndex:0]personFirst],[[existingPerson objectAtIndex:0]personLast]);
}
@end
