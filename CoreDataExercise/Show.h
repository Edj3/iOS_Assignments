//
//  Show.h
//  CoreDataExercise
//
//  Created by Unbounded on 4/17/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Show : NSManagedObject
@property (retain,nonatomic) NSString *showTitle;
@property (retain,nonatomic) NSString *showAuthor;
@property (retain,nonatomic) NSNumber *showSeason;
@property (retain,nonatomic) NSString *showAiring;
@end
