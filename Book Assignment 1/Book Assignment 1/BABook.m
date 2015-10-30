//
//  BABook.m
//  Book Assignment 1
//
//  Created by Unbounded on 3/30/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "BABook.h"

@implementation BABook

-(id)initWithTitle:(NSString*) title
        WithGenre:(NSString*) genre
       WithAuthor:(NSString*) author
    WithNumberOfPages:(NSString*) numberOfPages
{
    self = [super init];
    if(self != nil)
    {
        _bookTitle = title;
        _bookGenre = genre;
        _bookAuthor = author;
        _bookNumberOfPages = numberOfPages;
    }
    
    return self;
}

@end
