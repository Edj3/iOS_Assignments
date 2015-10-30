//
//  DetailViewController.m
//  MapExercise
//
//  Created by Unbounded on 4/23/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//
#import "DetailViewController.h"
#import "MasterViewController.h"
#import "myAnnotation.h"

@interface DetailViewController (){
    SearchViewController *svc;
    int clickCount;
    NSMutableData *myData;
    NSMutableDictionary *fullDataDictionary;
    NSArray *jsonResults;
    MyManager *shared;
    //MapRestaurant *myRestaurant;
}
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [self initializeEverything];
    jsonResults = [[NSArray alloc]init];
    //[self addAnnotations];
    shared = [MyManager sharedManager];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Restaurants in Area", @"Master");
    barButtonItem.tintColor = [UIColor blackColor];
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

- (IBAction)triggerSearchPopover:(id)sender {
    clickCount++;
    self.popSearch.delegate = self;
    [self.popSearch presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    if (clickCount % 2 == 0) {
        [self.popSearch dismissPopoverAnimated:YES];
    }
    clickCount = 0;
}

-(void)initializeEverything{
    svc = [[SearchViewController alloc]initWithNibName:@"SearchViewController" bundle:nil];
    self.popSearch = [[UIPopoverController alloc]initWithContentViewController:svc];
    [self.popSearch setPopoverContentSize:CGSizeMake(300, 300)];
    clickCount = 0;
}

-(void)sendJSONRequest{
    NSMutableString *locationString = [NSMutableString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%@,%@&radius=10000&types=restaurant&sensor=false&key=AIzaSyAw0m3prCKzqP-zrWauU7DsXJgMDnbQY-Y",shared.myLatGlobal,shared.myLngGlobal];
    NSLog(@"URL Connected to: %@",locationString);
    NSURL *url = [NSURL URLWithString:locationString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    if (connection) {
        myData = [[NSMutableData alloc]init];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    
    //  This method should only be called once per connection
    //  Purge the data >:) in case it's called more than once
    [myData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"didReceiveData");
    
    //  Starts downloading data
    //  append the received data to current data
    [myData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self parseJSON:myData];
}

- (void)parseJSON:(NSData*)data {
    fullDataDictionary = [NSJSONSerialization JSONObjectWithData:myData options:0 error:nil];
    jsonResults = [fullDataDictionary objectForKey:@"results"];
    for (NSDictionary* entries in jsonResults) {
        shared.restLat = [[[entries objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lat"];
        shared.restLng = [[[entries objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lng"];
        shared.restName = [[NSString alloc] initWithString:[entries objectForKey:@"name"]];
        shared.restAddress = [[NSString alloc] initWithString:[entries objectForKey:@"vicinity"]];
        //NSLog(@"Latitude %@, Longitude %@, Name %@, Address %@",shared.restLat,shared.restLng,shared.restName,shared.restAddress);
        //NSLog(@"Latitude %@, Longitude %@, Name %@, Address %@",myRestaurant.latitude,myRestaurant.longitude,myRestaurant.name,myRestaurant.address);
        [shared.restLatArray addObject:shared.restLat];
        [shared.restLngArray addObject:shared.restLng];
        [shared.restNameArray addObject:shared.restName];
        [shared.restAddressArray addObject:shared.restAddress];
        //NSLog(@"Latitude %@, Longitude %@, Name %@, Address %@",[[shared.restLatArray objectAtIndex:0]latitude],[[shared.restLngArray objectAtIndex:0]longitude],[[shared.restNameArray objectAtIndex:0]name],[[shared.restAddressArray objectAtIndex:0]address]);
        //        if ([musicDict objectForKey:albumLabel]) {
        //            [[musicDict objectForKey:albumLabel] addObject:albumTitle];
        //        } else {
        //            [musicDict setObject:[[NSMutableArray alloc] initWithObjects:albumTitle, nil] forKey:albumLabel];
        //        }
        //        [musicTable reloadData];
    }
    myData = nil;
}

@end
