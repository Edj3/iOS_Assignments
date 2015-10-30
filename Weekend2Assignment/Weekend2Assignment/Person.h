//
//  Person.h
//  Weekend2Assignment
//
//  Created by Unbounded on 4/5/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong,nonatomic) NSString *personFirst;
@property (strong,nonatomic) NSString *personMid;
@property (strong,nonatomic) NSString *personLast;
@property (strong,nonatomic) NSString *personDepart;
@property (strong,nonatomic) NSString *personDOB;

-(id)initWithFirstName: (NSString*) first
        WithMiddleName: (NSString*) mid
          WithLastName: (NSString*) last
        WithDepartment: (NSString*) department
               WithDOB: (NSString*) dob;
@end
