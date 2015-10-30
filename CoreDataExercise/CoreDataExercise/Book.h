//
//  Book.h
//  CoreDataExercise
//
//  Created by Unbounded on 4/17/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Book : NSManagedObject
@property (retain,nonatomic) NSString *bookTitle;
@property (retain,nonatomic) NSString *bookAuthor;
@property (retain,nonatomic) NSNumber *bookPageCount;
@property (retain,nonatomic) NSNumber *bookGirlCount;
@end
