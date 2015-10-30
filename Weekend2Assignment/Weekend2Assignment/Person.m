//
//  Person.m
//  Weekend2Assignment
//
//  Created by Unbounded on 4/5/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "Person.h"

@implementation Person
-(id)initWithFirstName:(NSString *)first
        WithMiddleName:(NSString *)mid
          WithLastName:(NSString *)last
        WithDepartment:(NSString *)department
               WithDOB:(NSString *)dob
{
    self = [super init];
    if(self)
    {
        _personFirst = first;
        _personMid = mid;
        _personLast = last;
        _personDepart = department;
        _personDOB = dob;
    }
    return self;
}
@end
