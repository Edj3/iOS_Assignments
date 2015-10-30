//
//  MasterViewController.m
//  Split View Exercise
//
//  Created by Unbounded on 4/3/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "BABook.h"
#import "BACell.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    //initialize array that will hold the data for all books
    _myTableArray = [[NSMutableArray alloc]init];
    
    
    NSLog(@"Array Made but not objects yet bro");
    
    
    //initialize 5 different books with their genres, titles, authors, and number of pages
    BABook *book1 = [[BABook alloc]initWithTitle:@"Book 1" WithGenre:@"Horror" WithAuthor:@"John Hancock" WithNumberOfPages:@"200"];
    BABook *book2 = [[BABook alloc]initWithTitle:@"Book 2" WithGenre:@"Horror" WithAuthor:@"Abraham Lincoln" WithNumberOfPages:@"100"];
    BABook *book3 = [[BABook alloc]initWithTitle:@"Book 3" WithGenre:@"Romantic Comedy" WithAuthor:@"Serena Spicy" WithNumberOfPages:@"500"];
    BABook *book4 = [[BABook alloc]initWithTitle:@"Book 4" WithGenre:@"Romantic Comedy" WithAuthor:@"Seth Myers" WithNumberOfPages:@"400"];
    BABook *book5 = [[BABook alloc]initWithTitle:@"Book 5" WithGenre:@"Bad Music" WithAuthor:@"Nicki Minaj" WithNumberOfPages:@"2"];
    NSLog(@"Object Initialization Going good so far");
    
    //add all of the created book objects to the array
    [_myTableArray addObject:book1];
    [_myTableArray addObject:book2];
    [_myTableArray addObject:book3];
    [_myTableArray addObject:book4];
    [_myTableArray addObject:book5];
    
    //initialize the array to contain all the genres of each book
    myGenres = [[NSMutableArray alloc]init];
    
    //add the genres without repeating (taking in the 3 books with unique genres only)
    //IMPORTANT: You are using this for the count of all the genres only
    [myGenres addObject:[[_myTableArray objectAtIndex:0] bookGenre]];
    [myGenres addObject:[[_myTableArray objectAtIndex:2] bookGenre]];
    [myGenres addObject:[[_myTableArray objectAtIndex:4] bookGenre]];
    
    //initialize arrays that will have Genre at index 0 and then all books of the genre in the following indexes
    myHorrorBooks = [[NSMutableArray alloc]init];
    myRomComBooks =[[NSMutableArray alloc]init];
    myBadMusic = [[NSMutableArray alloc]init];
    
    //add the genre at the first index and then all the horror books in the following indexes
    [myHorrorBooks addObject:[myGenres objectAtIndex:0]];
    [myHorrorBooks addObject:[_myTableArray objectAtIndex:0]];
    [myHorrorBooks addObject:[_myTableArray objectAtIndex:1]];
    
    //add the genre at the first index and then all the Romantic Comedy books in the following indexes
    [myRomComBooks addObject:[myGenres objectAtIndex:1]];
    [myRomComBooks addObject:[_myTableArray objectAtIndex:2]];
    [myRomComBooks addObject:[_myTableArray objectAtIndex:3]];
    
    //add the genre at the first index and then all the Bad Music books in the following indexes
    [myBadMusic addObject:[myGenres objectAtIndex:2]];
    [myBadMusic addObject:[_myTableArray objectAtIndex:4]];
    
    //initialize array to organize all books by genres
    myRows = [[NSMutableArray alloc]init];
    [myRows addObject:myHorrorBooks];
    [myRows addObject:myRomComBooks];
    [myRows addObject:myBadMusic];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
    //count is an inte
    return [_myTableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BACell";
    BACell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //You need the + 1 on the indexPath.row because in each of your book arrays, you need to skip over the genre or it will mismatch everything and crash
    BABook *bookList = [_myTableArray objectAtIndex:indexPath.row];
    
    //Set the labels in each cell equal to the object bookList that is created using the proper indexing of your 2D array
    cell.lblTitle.text = bookList.bookTitle;
    cell.lblAuthor.text = bookList.bookAuthor;
    cell.lblNumberOfPages.text = bookList.bookNumberOfPages;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dtv = [[((UINavigationController*)[[self.splitViewController viewControllers]objectAtIndex:1])viewControllers]objectAtIndex:0];
    [dtv.displayGenre setText:[[_myTableArray objectAtIndex:indexPath.row] bookGenre]];
    [dtv.displayTitle setText:[[_myTableArray objectAtIndex:indexPath.row] bookTitle]];
    [dtv.displayAuthor setText:[[_myTableArray objectAtIndex:indexPath.row] bookAuthor]];
    [dtv.displayPages setText:[[_myTableArray objectAtIndex:indexPath.row] bookNumberOfPages]];
}

@end
