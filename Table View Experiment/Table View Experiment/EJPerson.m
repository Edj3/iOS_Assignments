//
//  EJPerson.m
//  Table View Experiment
//
//  Created by Unbounded on 3/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "EJPerson.h"

@implementation EJPerson

//You don't have to synthesize, this just makes it easier for you to name properties from your .h
@synthesize middleName;

//initialize your properties
-(id)initWithfirstName: (NSString*) first
            middleName: (NSString*) mid
              lastName: (NSString*) last
{
    self = [super init];
    
    if (self != nil)
    {
        _firstName = first;
        middleName = mid;
        _lastName = last;
    }
    return self;
//Now we have an object that will hold 3 strings!
}
@end
