//
//  JSONParser.m
//  MapExercise
//
//  Created by Unbounded on 4/27/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser
{
    NSMutableData *myData;
    MyManager *shared;
    NSMutableDictionary *fullDataDictionary;
    NSMutableArray *jsonResults;
}
-(void)sendJSONRequest{
    shared = [MyManager sharedManager];
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
