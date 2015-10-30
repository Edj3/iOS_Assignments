//
//  MyManager.h
//  Weekend2Assignment
//
//  Created by Unbounded on 4/9/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface MyManager : NSObject
//Singleton Header Class
@property (strong, nonatomic) Person *myGlobalPerson;
@property (strong,nonatomic) NSMutableArray *myGlobalArray;
@property (strong,nonatomic) NSMutableDictionary *myGlobalDictionary;
+(MyManager*)getMyManager;
@end
