//
//  MasterViewController.m
//  MapExercise
//
//  Created by Unbounded on 4/23/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
    
    NSString *savedCity;
    NSString *savedState;
    MyManager *shared;
    NSMutableData *jsonData;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.tableView reloadData];
    //[xmlParser parse];
    

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    shared = [MyManager sharedManager];
    [self.tableView reloadData];
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

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return _objects.count;
    if (shared.restLatArray.count == 0) {
        return 0;
    }else{
        return shared.restLatArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    //NSDate *object = _objects[indexPath.row];
    //cell.textLabel.text = [object description];
    //cell.textLabel.text = myLat;
    cell.textLabel.text = [shared.restNameArray objectAtIndex:indexPath.row];
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
        [shared.restLatArray removeObjectAtIndex:indexPath.row];
        [shared.restLngArray removeObjectAtIndex:indexPath.row];
        [shared.restNameArray removeObjectAtIndex:indexPath.row];
        [shared.restAddressArray removeObjectAtIndex:indexPath.row];
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
    NSDate *object = _objects[indexPath.row];
    self.detailViewController.detailItem = object;
    shared.clickedLat = [NSNumber numberWithFloat:[[shared.restLatArray objectAtIndex:indexPath.row] floatValue]];
    shared.clickedLng = [NSNumber numberWithFloat:[[shared.restLngArray objectAtIndex:indexPath.row] floatValue]];
    shared.clickedName = [shared.restNameArray objectAtIndex:indexPath.row];
    shared.clickedAddress = [shared.restAddressArray objectAtIndex:indexPath.row];
    NSLog(@"You're coordinate is: %@,%@",shared.clickedLat,shared.clickedLng);
    [self addAnnotations];
}


-(void)addAnnotations{
    MKCoordinateSpan span;
    span.latitudeDelta = .003;
    span.longitudeDelta = .003;
    MKCoordinateRegion region;
    
    //this center coordinate should change every time you perform a tap gesture
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake((CLLocationDegrees)[shared.clickedLat floatValue], (CLLocationDegrees)[shared.clickedLng floatValue]);
    region.center = coordinate;
    region.span = span;
    [self.detailViewController.myMap setRegion:region animated:YES];
    myAnnotation *annotation = [[myAnnotation alloc]initWithCoordinate:coordinate WithTitle:shared.clickedName WithSubtitle:shared.clickedAddress];
    [self.detailViewController.myMap addAnnotation:annotation];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    static NSString *pinIdentifier = @"mypin";
    if ([annotation isKindOfClass:[myAnnotation class]]) {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView*) [mapView dequeueReusableAnnotationViewWithIdentifier:pinIdentifier];
        if (!annotationView) {
            annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:pinIdentifier];
        }else{
            annotationView.annotation = annotation;
        }
        [annotationView setEnabled: YES];
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:@"pin.png"];
        shared.mapButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [shared.mapButton addTarget:self action:@selector(showDetail) forControlEvents:UIControlEventTouchUpInside];
        [annotationView setRightCalloutAccessoryView:shared.mapButton];
        [annotationView setDraggable:YES];
        return annotationView;
        
    }
    return nil;
}

@end
