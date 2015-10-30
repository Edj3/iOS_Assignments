//
//  BABook.h
//  Book Assignment 1
//
//  Created by Unbounded on 3/30/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BABook : NSObject

@property (strong,nonatomic) NSString *bookTitle;
@property (strong,nonatomic) NSString *bookGenre;
@property (strong,nonatomic) NSString *bookAuthor;
@property (strong,nonatomic) NSString *bookNumberOfPages;
-(id)initWithTitle: (NSString*) title
         WithGenre: (NSString*) genre
        WithAuthor: (NSString*) author
 WithNumberOfPages: (NSString*) numberOfPages;

@end
