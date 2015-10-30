//
//  AllDataTableViewController.m
//  SimpleJSONExercise
//
//  Created by Unbounded on 4/18/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "AllDataTableViewController.h"
#import "Item.h"
#import "myCell.h"

@interface AllDataTableViewController ()
{
    NSMutableData *jsonData;
    NSMutableString *jsonResult;
    NSMutableArray *tableArray;
    UIImage *dataImage;
    UIImageView *dataImageView;
}

@end

@implementation AllDataTableViewController

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
    self.tableView.delegate = self;
    tableArray = [[NSMutableArray alloc]init];
    [self sendJSONRequest];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [tableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [dataImageView setFrame:CGRectMake(0, 0, 0, 0)];
    static NSString *CellIdentifier = @"myCell";
    myCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    // Configure the cell...
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        Item *tableItem = [tableArray objectAtIndex:indexPath.row];
        NSString *dataString = tableItem.data;
        NSData *getURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:dataString]];
        
        
        cell.myTableText.text = tableItem.type;
        if ([tableItem.type isEqualToString: @"image"]) {
            dataImage = [UIImage imageWithData:getURL];
            dataImageView = [[UIImageView alloc]initWithImage:dataImage];
            [dataImageView setFrame:CGRectMake(20, 20, 40, 40)];
            [cell addSubview:dataImageView];
        }else{
            cell.myTableData.text = tableItem.data;
        }
    });
    
    
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

-(void)sendJSONRequest{
    NSURL *url = [NSURL URLWithString:@"http://dev.fuzzproductions.com/MobileTest/test.json"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    if (connection) {
        jsonData = [[NSMutableData alloc]init];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [jsonData setLength:0];
    NSLog(@"Resetting Length to 0");
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [jsonData appendData:data];
    NSLog(@"Appending Data...");
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Connection Failed. Error - %@ %@",[error localizedDescription],[[error userInfo] objectForKey:NSURLErrorFailingURLErrorKey]);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    //Begin JSON code
    //JSON is set up as
    NSMutableArray *fullDataArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
   
    for(NSDictionary *dict in fullDataArray)
    {
        Item *myItem = [Item new];
        myItem.type = [dict valueForKey:@"type"];
        myItem.data = [dict valueForKey:@"data"];
        [tableArray addObject:myItem];
    }
    NSLog(@"Parsing your JSON Data...");
    [self.tableView reloadData];
    
}
@end
