//
//  SharedResource.m
//  SingletonAssignment
//
//  Created by Unbounded on 4/12/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "SharedResource.h"

@implementation SharedResource
+(SharedResource*) getResource
{
    static SharedResource *sharedInstance;
    if(!sharedInstance)
    {
        sharedInstance = [[super allocWithZone:nil]init];
    }
    return sharedInstance;
}

+(id)allocWithZone:(NSZone *)zone
{
    return [self getResource];
}

-(id) init
{
    self = [super init];
    if(self)
    {
        _myGlobalMovie = [[Movie alloc]init];
        _myGlobalArray =[[NSMutableArray alloc]init];
    }
    return self;
}
@end
