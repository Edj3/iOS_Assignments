//
//  MyTableViewController.m
//  Book Assignment 1
//
//  Created by Unbounded on 3/30/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //initialize array that will hold the data for all books
    myTableArray = [[NSMutableArray alloc]init];
    
    
    NSLog(@"Array Made but not objects yet bro");
    
    
    //initialize 5 different books with their genres, titles, authors, and number of pages
    BABook *book1 = [[BABook alloc]initWithTitle:@"Book 1" WithGenre:@"Horror" WithAuthor:@"John Hancock" WithNumberOfPages:@"200"];
    BABook *book2 = [[BABook alloc]initWithTitle:@"Book 2" WithGenre:@"Horror" WithAuthor:@"Abraham Lincoln" WithNumberOfPages:@"100"];
    BABook *book3 = [[BABook alloc]initWithTitle:@"Book 3" WithGenre:@"Romantic Comedy" WithAuthor:@"Serena Spicy" WithNumberOfPages:@"500"];
    BABook *book4 = [[BABook alloc]initWithTitle:@"Book 4" WithGenre:@"Romantic Comedy" WithAuthor:@"Seth Myers" WithNumberOfPages:@"400"];
    BABook *book5 = [[BABook alloc]initWithTitle:@"Book 5" WithGenre:@"Bad Music" WithAuthor:@"Nicki Minaj" WithNumberOfPages:@"2"];
    NSLog(@"Object Initialization Going good so far");
    
    //add all of the created book objects to the array
    [myTableArray addObject:book1];
    [myTableArray addObject:book2];
    [myTableArray addObject:book3];
    [myTableArray addObject:book4];
    [myTableArray addObject:book5];
    
    //initialize the array to contain all the genres of each book
    myGenres = [[NSMutableArray alloc]init];
    
    //add the genres without repeating (taking in the 3 books with unique genres only)
    //IMPORTANT: You are using this for the count of all the genres only
    [myGenres addObject:[[myTableArray objectAtIndex:0] bookGenre]];
    [myGenres addObject:[[myTableArray objectAtIndex:2] bookGenre]];
    [myGenres addObject:[[myTableArray objectAtIndex:4] bookGenre]];
    
    //initialize arrays that will have Genre at index 0 and then all books of the genre in the following indexes
    myHorrorBooks = [[NSMutableArray alloc]init];
    myRomComBooks =[[NSMutableArray alloc]init];
    myBadMusic = [[NSMutableArray alloc]init];
    
    //add the genre at the first index and then all the horror books in the following indexes
    [myHorrorBooks addObject:[myGenres objectAtIndex:0]];
    [myHorrorBooks addObject:[myTableArray objectAtIndex:0]];
    [myHorrorBooks addObject:[myTableArray objectAtIndex:1]];
    
    //add the genre at the first index and then all the Romantic Comedy books in the following indexes
    [myRomComBooks addObject:[myGenres objectAtIndex:1]];
    [myRomComBooks addObject:[myTableArray objectAtIndex:2]];
    [myRomComBooks addObject:[myTableArray objectAtIndex:3]];
    
    //add the genre at the first index and then all the Bad Music books in the following indexes
    [myBadMusic addObject:[myGenres objectAtIndex:2]];
    [myBadMusic addObject:[myTableArray objectAtIndex:4]];
    
    //initialize array to organize all books by genres
    myRows = [[NSMutableArray alloc]init];
    [myRows addObject:myHorrorBooks];
    [myRows addObject:myRomComBooks];
    [myRows addObject:myBadMusic];
    
    
    NSLog(@"Book Objects added correctly");
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
    return [myGenres count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //count is an inte
    return [[myRows objectAtIndex:section] count] - 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //You want to return the genre as the header for whatever section you're on. The section parameter just means "whatever section youre on!"
    return [myGenres objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BACell";
    BACell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //You need the + 1 on the indexPath.row because in each of your book arrays, you need to skip over the genre or it will mismatch everything and crash
    BABook *bookList = [[myRows objectAtIndex:indexPath.section] objectAtIndex:indexPath.row + 1];
    
    //Set the labels in each cell equal to the object bookList that is created using the proper indexing of your 2D array
    cell.lblTitle.text = bookList.bookTitle;
    cell.lblAuthor.text = bookList.bookAuthor;
    cell.lblNumberOfPages.text = bookList.bookNumberOfPages;
    
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
