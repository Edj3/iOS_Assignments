//
//  MyManager.m
//  Weekend2Assignment
//
//  Created by Unbounded on 4/9/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "MyManager.h"

@implementation MyManager
//Singleton implementation class
+(MyManager*)getMyManager
{
    static MyManager *sharedInstance;
    
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:nil]init];
    }
    return sharedInstance;
}

+(id) allocWithZone:(NSZone *)zone
{
    return [self getMyManager];
}

-(id) init
{
    self = [super init];
    if (self)
    {
        _myGlobalArray = [[NSMutableArray alloc]init];
        _myGlobalPerson = [[Person alloc]init];
        _myGlobalDictionary = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}
@end
