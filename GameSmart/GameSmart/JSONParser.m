//
//  JSONParser.m
//  GameSmart
//
//  Created by Unbounded on 4/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "JSONParser.h"

#define kGiantBombAPIKey @"fd38b4a620804c74fe820c0767dbd33d77f84a8e"

@implementation JSONParser
{
    NSMutableData *myData;
    GameManager *shared;
    NSMutableDictionary *fullDataDictionary;
    NSMutableArray *jsonResults;
}
-(void)sendJSONRequest{
    shared = [GameManager sharedManager];
    NSMutableString *locationString = [NSMutableString stringWithFormat:@"http://www.giantbomb.com/api/search/?api_key=%@&format=json&query=%%22%@%%22&resources=game",kGiantBombAPIKey,shared.gameSearched];
    //NSMutableString *locationString = [NSMutableString stringWithFormat:@"http://www.giantbomb.com/api/search/?api_key=fd38b4a620804c74fe820c0767dbd33d77f84a8e&format=json&query=%%22Metroid20Prime%%22&resources=game"];
    NSLog(@"URL Connected to: %@",locationString);
    NSURL *url = [NSURL URLWithString:locationString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    if (connection) {
        myData = [[NSMutableData alloc]init];
    }else{
        NSLog(@"Trouble getting a connection");
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
    NSString *rMonth = [[NSString alloc]init];
    NSString *rDay = [[NSString alloc]init];
    NSString *rYear = [[NSString alloc]init];
    fullDataDictionary = [NSJSONSerialization JSONObjectWithData:myData options:0 error:nil];
    jsonResults = [fullDataDictionary objectForKey:@"results"];
    for (NSDictionary* entries in jsonResults) {
        Game *newGame = [[Game alloc]init];
        newGame.name = [entries objectForKey:@"name"];
        newGame.description = [entries objectForKey:@"description"];
        newGame.smallImage = [[entries objectForKey:@"image"]objectForKey:@"small_url"];
        newGame.bigImage = [[entries objectForKey:@"image"]objectForKey:@"super_url"];
        newGame.originalRelease = [entries objectForKey:@"original_release_date"];
        newGame.rating = [entries objectForKey:@"original_game_rating"];
        //Grab Date
        rMonth = [entries objectForKey:@"expected_release_month"];
        rDay = [entries objectForKey:@"expected_release_day"];
        rYear = [entries objectForKey:@"expected_release_year"];
        NSString *rDate = [NSString stringWithFormat:@"%@/%@/%@",rMonth,rDay,rYear];
        newGame.expectedRelease = rDate;
        //NSLog(@"Testing Object: %@ %@ %@ %@ %@ %@",newGame.name,newGame.smallImage,newGame.bigImage,newGame.originalRelease,newGame.rating,newGame.expectedRelease);
        [shared.arrayGames addObject:newGame];
        NSLog(@"Test with array of objects: %@ %@",[[shared.arrayGames objectAtIndex:0] name],[[shared.arrayGames objectAtIndex:0] expectedRelease]);
    }
    myData = nil;
}

@end
