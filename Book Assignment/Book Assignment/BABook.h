//
//  BABook.h
//  Book Assignment
//
//  Created by Unbounded on 3/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BABook : NSObject
@property (strong,nonatomic) NSString *bookGenre;
@property (strong,nonatomic) NSString *bookTitle;
@property (strong,nonatomic) NSString *bookAuthor;
@property (strong,nonatomic) NSNumber *bookPageNumbers;

-(id)initWithbookGenre: (NSString*) genre
             bookTitle: (NSString*) title
            bookAuthor: (NSString*) author
       bookPageNumbers: (NSNumber*) pageNumbers;

@end
