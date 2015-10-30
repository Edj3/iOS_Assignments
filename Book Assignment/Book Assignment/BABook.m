//
//  BABook.m
//  Book Assignment
//
//  Created by Unbounded on 3/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "BABook.h"

@implementation BABook

-(id)initWithbookGenre:(NSString *)genre
             bookTitle:(NSString *)title
            bookAuthor:(NSString *)author
       bookPageNumbers:(NSNumber *)pageNumbers
{
    self = [super init];
    
    if (self != nil)
    {
        _bookGenre = genre;
        _bookTitle = title;
        _bookAuthor = author;
        _bookPageNumbers = pageNumbers;
    }
    
    return self;
}

@end
