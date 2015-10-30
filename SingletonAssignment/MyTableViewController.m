//
//  MyTableViewController.m
//  SingletonAssignment
//
//  Created by Unbounded on 4/12/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "MyTableViewController.h"
#import "MovieViewController.h"
#import "SharedResource.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//make sure you pass in the bar button item
-(void)pushView:(UIBarButtonItem*) barButton
{
    //instantiate view controller of next controller by using nib name as identifier
    MovieViewController *vc2 = [[MovieViewController alloc]initWithNibName:@"MovieViewController" bundle:nil];
    //push to the next view controller
    [[self navigationController]pushViewController:vc2 animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    //add a title on the navigation bar for this view
    self.navigationItem.title = @"Movies";
    //add a bar button item that when clicked will push to the next view
    UIBarButtonItem *rightNavButton = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(pushView:)];
    //Put the button on the right side of the navigation bar
    [self.navigationItem setRightBarButtonItem:rightNavButton animated:YES];
    [self.myTableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SharedResource *sr = [SharedResource getResource];
    if ([sr.myGlobalArray count] > 0) {
        return[sr.myGlobalArray count];
    }
    return 1;
    //return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    SharedResource *sr = [SharedResource getResource];
    MyTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell)
    {
        cell = [[MyTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.cellMovie = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 40)];
    cell.cellYear = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 80, 40)];
    [cell.cellMovie setBackgroundColor:[UIColor redColor]];
    [cell setBackgroundColor:[UIColor blackColor]];
    [cell addSubview:cell.cellMovie];
    [cell addSubview:cell.cellYear];
    [cell.cellMovie setText: [[sr.myGlobalArray objectAtIndex:indexPath.row] movietitle]];
    [cell.cellYear setText: [[sr.myGlobalArray objectAtIndex:indexPath.row] movieYear]];
    //cell.cellYear.text = @"Happy";
    //cell.cellMovie.text = @"Birthday";
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
