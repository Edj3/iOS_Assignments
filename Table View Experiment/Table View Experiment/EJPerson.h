//
//  EJPerson.h
//  Table View Experiment
//
//  Created by Unbounded on 3/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EJPerson : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *middleName;
@property (strong, nonatomic) NSString *lastName;

-(id)initWithfirstName: (NSString*) first
            middleName: (NSString*) mid
              lastName: (NSString*) last;

@end
