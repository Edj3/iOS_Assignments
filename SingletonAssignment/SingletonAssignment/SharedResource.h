//
//  SharedResource.h
//  SingletonAssignment
//
//  Created by Unbounded on 4/12/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@interface SharedResource : NSObject
@property (strong,nonatomic) Movie *myGlobalMovie;
@property (strong, nonatomic) NSMutableArray *myGlobalArray;
+(SharedResource*) getResource;
@end
