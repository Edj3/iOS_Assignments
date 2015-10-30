//
//  SearchViewController.m
//  MapExercise
//
//  Created by Unbounded on 4/23/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "SearchViewController.h"
#import "MyManager.h"

@interface SearchViewController ()
{
    MyManager *shared;
    //Parsing XML Data Objects
    BOOL xmlDone;
    BOOL elementFound;
    BOOL jsonTrigger;
    NSMutableData *myData;
    NSXMLParser *xmlParser;
    NSMutableString *latResult;
    NSMutableString *lngResult;
    
    //JSON
    JSONParser *jParse;
    NSMutableDictionary *fullDataDictionary;
    NSMutableArray *jsonResults;
}
@end

@implementation SearchViewController

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
    // Do any additional setup after loading the view from its nib.
    [self initializeEverything];
    [self setDelegates];
    shared = [MyManager sharedManager];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchForRestaurant:(id)sender {
    shared.cityGlobal = self.cityField.text;
    shared.stateGlobal = self.stateField.text;
    UIAlertView *locationSubmitted = [[UIAlertView alloc]initWithTitle:@"Location Saved!" message:@"Press OK to continue" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [self.stateField resignFirstResponder];
    locationSubmitted.delegate = self;
    [locationSubmitted show];
    NSLog(@"%@",shared.cityGlobal);
    NSLog(@"%@",shared.stateGlobal);
    jParse = [[JSONParser alloc]init];
    [self requestXMLData];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)initializeEverything{
    [self.view setBackgroundColor:[UIColor blackColor]];
}

-(void)setDelegates{
    self.cityField.delegate = self;
    self.stateField.delegate = self;
}

-(void)requestXMLData{
    NSMutableString *locationString = [NSMutableString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/xml?address=%@,+%@&sensor=true",shared.cityGlobal,shared.stateGlobal];
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:locationString]];
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:theRequest delegate:self];
    if (connection) {
        NSLog(@"Connected to %@",locationString);
        myData = [NSMutableData data];
    }else{
        NSLog(@"Sorry bro, the connection failed");
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"%@",response.description);
    [myData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [myData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Sorry bro, the Connection is no good and failed. ERROR: - %@ %@",[error localizedDescription],[[error userInfo]objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"Succeeded! Received %d bytes of data",[myData length]);
    xmlParser = [[NSXMLParser alloc]initWithData:myData];
    xmlParser.delegate = self;
    [xmlParser parse];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"geometry"]) {
        //latResult = [[NSMutableString alloc]init];
        //lonResult = [[NSMutableString alloc]init];
        elementFound = YES;
    }
    if ([elementName isEqualToString:@"lat"]) {
        if (!latResult) {
            latResult = [[NSMutableString alloc]init];
            //elementFound = YES;
        }
    }
    if ([elementName isEqualToString:@"lng"]) {
        if (!lngResult) {
            lngResult = [[NSMutableString alloc]init];
            //elementFound = YES;
        }
    }
    //    if ([elementName isEqualToString:@"geometry"]) {
    //        xmlResult = [[NSMutableString alloc]init];
    //        elementFound = YES;
    //
    //    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if (elementFound == YES) {
        [latResult appendString:string];
        [lngResult appendString:string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if (elementFound == YES) {
        if ([elementName isEqualToString:@"lat"]) {
            self.myLat = latResult;
            NSLog(@"My Latitude is... %@",self.myLat);
            latResult = NULL;
        }
    }
    if (elementFound == YES) {
        if ([elementName isEqualToString:@"lng"]) {
            self.myLng = lngResult;
            NSLog(@"My Longitude is... %@",self.myLng);
            elementFound = NO;
            lngResult = NULL;
        }
    }
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    myData = nil;
    shared.myLatGlobal = self.myLat;
    shared.myLngGlobal = self.myLng;
    [jParse sendJSONRequest];
}

@end
