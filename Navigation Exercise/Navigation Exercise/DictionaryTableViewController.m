//
//  DictionaryTableViewController.m
//  Navigation Exercise
//
//  Created by Unbounded on 4/2/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "DictionaryTableViewController.h"
#import "DictionaryDetailViewController.h"

@interface DictionaryTableViewController ()

@end

@implementation DictionaryTableViewController
{
    NSMutableDictionary *dicTerms;
    NSArray *dicKeys;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //initialize the dictionary and set the capacity
    dicTerms = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"Very Cool to Nerdy Ppl" ,@"l337",
                @"Laugh Out Loud!",@"lol",
                @"Hit me up.",@"hmu", nil];
    
    //create an array to index the terms for the dictionary
    dicKeys = [NSArray arrayWithObjects:@"l337",@"lol",@"hmu", nil];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [dicKeys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"dicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [dicKeys objectAtIndex:indexPath.row];
    //cell.textLabel.text = [dicTerms objectForKey:@"lol"];
    
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

//#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//Makes new instance of DetailViewController
    
 DictionaryDetailViewController *dictionaryDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DictionaryDetailViewController"];
    [self.navigationController pushViewController:dictionaryDetailViewController animated:YES];
dictionaryDetailViewController.wordKey.text = [dicKeys objectAtIndex:indexPath.row];
    dictionaryDetailViewController.definition.text = [dicTerms objectForKey:[dicKeys objectAtIndex:indexPath.row]];
}

@end
