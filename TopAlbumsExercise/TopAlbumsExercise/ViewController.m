//
//  ViewController.m
//  TopAlbumsExercise
//
//  Created by Unbounded on 4/15/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"
#import "myCell.h"
#import "Category.h"

@interface ViewController ()
{
    NSMutableData *xmlData;
    NSMutableString *xmlResult;
    NSMutableString *genreResult;
    NSXMLParser *myXMLParser;
    NSMutableArray *titles;
    NSMutableArray *genres;
    NSArray *keys;
    NSMutableData *jsonData;
    NSMutableString *jsonResult;
    NSString *onRequest;
    BOOL elementFound;
    BOOL checkEntry;
    NSMutableString *valueGenre;
    Category *myCat;
    NSMutableArray *catArray;
    NSMutableDictionary *songDict;
    NSMutableDictionary *xmlDict;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.myTableView.delegate = self;
    myXMLParser.delegate = self;
    genreResult = [[NSMutableString alloc]init];
    onRequest = [[NSString alloc]init];
    titles = [[NSMutableArray alloc]init];
    songDict = [[NSMutableDictionary alloc]init];
    valueGenre = [[NSMutableString alloc]init];
    genres = [[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([onRequest isEqualToString:@"XML"]) {
        return genres.count;
    }else{
        return [[songDict allKeys] count];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([onRequest isEqualToString:@"XML"]) {
        return titles.count;
    }else{
        NSArray* songKeys = [[NSArray alloc] initWithArray:[songDict allKeys]];
        return [[songDict objectForKey:[songKeys objectAtIndex:section]] count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"myCell";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //cell.textLabel.text = @"Something";
//    if (titles != nil) {
//        cell.textLabel.text = [titles objectAtIndex:indexPath.row];
//        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
//        cell.textLabel.numberOfLines = 0;
//    }else{
//        cell.textLabel.text = xmlResult;
//        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
//        cell.textLabel.numberOfLines = 0;
//    }
//    
    
    
    if ([onRequest isEqualToString:@"XML"]) {
        cell.textLabel.text = [titles objectAtIndex:indexPath.row];
    }else{
        NSArray* keyArr = [songDict allKeys];
        NSString* sectionKey = [keyArr objectAtIndex:indexPath.section];
        NSArray* sectionArr = [songDict objectForKey:sectionKey];
        NSString* rowLabel = [sectionArr objectAtIndex:indexPath.row];
        cell.textLabel.text = rowLabel;
    }
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if ([onRequest isEqualToString:@"XML"]) {
        return [genres objectAtIndex:section];
    }else{
        NSArray* songKeys = [[NSArray alloc] initWithArray:[songDict allKeys]];
        return [songKeys objectAtIndex:section];
    }
}

- (IBAction)parserSelect:(id)sender {
    switch (self.mySegment.selectedSegmentIndex) {
        case 0:
            NSLog(@"XML");
            onRequest = @"XML";
            [self sendXMLRequest];
            break;
        case 1:
            NSLog(@"JSON");
            //onRequest = @"JSON";
            [genres removeAllObjects];
            [titles removeAllObjects];
            [self sendJSONRequest];
        default:
            break;
    }
}
-(void)sendXMLRequest{
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://itunes.apple.com/us/rss/topalbums/limit=10/xml"]];
    NSURLConnection *theConnection = [[NSURLConnection alloc]initWithRequest:theRequest delegate:self];
    NSLog(@"Establishing Connection...");
    if (theConnection) {
        xmlData = [NSMutableData data];
        NSLog(@"Connected! Collecting Data...");
    }else{
        NSLog(@"The Connection has failed.");
    }
}

-(void)sendJSONRequest{
    NSURL *url = [NSURL URLWithString:@"http://itunes.apple.com/us/rss/topalbums/limit=10/json"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    if (connection) {
        jsonData = [NSMutableData data];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    if ([onRequest isEqualToString: @"XML"]) {
        [xmlData setLength:0];
    }else{
        [jsonData setLength:0];
    }
    NSLog(@"Resetting Length to 0");
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    if ([onRequest isEqualToString:@"XML"]) {
        [xmlData appendData:data];
    }else{
        [jsonData appendData:data];
        NSLog(@"Firing off JSON");
    }
    NSLog(@"Appending Data...");
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Connection Failed. Error - %@ %@",[error localizedDescription],[[error userInfo] objectForKey:NSURLErrorFailingURLErrorKey]);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if ([onRequest isEqualToString:@"XML"]) {
        //Begin XML Code
        NSLog(@"Succeeded! Received %d bytes of Data!",[xmlData length]);
        //Start Parsing!
        myXMLParser = [[NSXMLParser alloc]initWithData:xmlData];
        [myXMLParser setDelegate:self];
        [myXMLParser parse];
        NSLog(@"Parsing...");
    }else{
        //Begin JSON code
        [self parseJSONData:jsonData];
//        NSDictionary *fullDataDictionary =[NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
//        NSMutableArray *titleArray = [fullDataDictionary objectForKey:@"title"];
//        NSMutableArray *labelArray = [fullDataDictionary objectForKey:@"label"];
//        for(NSDictionary *titleDict in titleArray){
//            NSDictionary *feedDict = [titleDict objectForKey:@"feed"];
//            NSDictionary *entryDict = [feedDict objectForKey:@"entry"];
//            NSString *title = [entryDict objectForKey:@"title"];
//            [titleArray addObject:title];
//        }
//        for(NSDictionary *labelDict in titleArray){
//            NSDictionary *feedDict = [labelDict objectForKey:@"feed"];
//            NSDictionary *entryDict = [feedDict objectForKey:@"entry"];
//            NSDictionary *categoryDict = [entryDict objectForKey:@"category"];
//            NSDictionary *attDict = [categoryDict objectForKey:@"attributes"];
//            NSString *label = [entryDict objectForKey:@"label"];
//            [labelArray addObject:label];
//            NSLog(@"JSON Parsing...");
//            
//            [self.myTableView reloadData];
//        }
        
    }
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"entry"]) {
        checkEntry = YES;
        
    }
    if (checkEntry == YES) {
        if ([elementName isEqualToString:@"category"]) {
            //if (!genres) {
                //genreResult = [[NSMutableString alloc]init];
                valueGenre = [attributeDict objectForKey:@"label"];
                //elementFound = YES;
                [genres addObject:valueGenre];
            //}
        }
            
        }
        if ([elementName isEqualToString:@"title"]) {
            xmlResult = [[NSMutableString alloc]init];
            elementFound = YES;
        }
    
    //}


}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if (elementFound == YES && checkEntry == YES) {
        [xmlResult appendString:string];
        //[genreResult appendString:string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"category"]) {
        //NSLog(@"First Genre is %@",[genres objectAtIndex:0]);
        //genreResult = [NSMutableString stringWithFormat:@""];
        //elementFound = NO;
    }
    if (checkEntry == YES && elementFound == YES) {
        [titles addObject:xmlResult];
        //[xmlDict setObject:titles forKey:valueGenre];
        //xmlResult = [NSMutableString stringWithFormat:@""];
        xmlResult = [NSMutableString stringWithString:@""];
        elementFound = NO;
        
    }
    
    //elementFound = NO;
    //NSLog(@"Parsing Finished Display:%@",xmlResult);
    //NSLog(@"Here is the value %@",valueGenre);
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    //valueGenre = [NSMutableString stringWithString:@""];
    //checkEntry = NO;
    [self.myTableView reloadData];
    self.testLabel.text = xmlResult;
    for (int i = 0; i < 5; i++) {
        NSLog(@"\nGenres are: %@\nTitle is: %@",[genres objectAtIndex:i],[titles objectAtIndex:i]);
    }
}

- (void)parseJSONData:(NSData*)data {
    NSMutableDictionary *fullDataDictionary = [[NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil] objectForKey:@"feed"];
    NSArray *albums = [[NSArray alloc] initWithArray:[fullDataDictionary objectForKey:@"entry"]];
    for (NSDictionary *entries in albums) {
        NSString *albumTitle = [[NSString alloc] initWithString:[[entries objectForKey:@"im:name"] objectForKey:@"label"]];
        NSString *albumLabel = [[NSString alloc] initWithString:[[[entries objectForKey:@"category"] objectForKey:@"attributes"] objectForKey:@"label"]];
        if ([songDict objectForKey:albumLabel]) {
            [[songDict objectForKey:albumLabel] addObject:albumTitle];
        } else {
            [songDict setObject:[[NSMutableArray alloc] initWithObjects:albumTitle, nil] forKey:albumLabel];
        }
        NSLog(@"JSON should be parsed. Album Title: %@, Album Label: %@",albumTitle,albumLabel);
        [self.myTableView reloadData];
    }
}
@end
