//
//  SharedResource.h
//  SingletonProtocol
//
//  Created by Unbounded on 4/11/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@interface SharedResource : NSObject

@property (strong,nonatomic) Movie *myGlobalMovie;
@property (strong, nonatomic) NSMutableArray *myGlobalArray;
+(SharedResource*) getResource;
@end
