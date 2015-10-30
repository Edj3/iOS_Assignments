//
//  Movie.m
//  SingletonProtocol
//
//  Created by Unbounded on 4/11/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "Movie.h"

@implementation Movie
-(id)initWithMovieTitle:(NSString *)title MovieYear:(NSString *)year MovieCast:(UITextView *)cast
{
    self = [super init];
    if(self){
        self.movietitle = title;
        self.movieYear = year;
        self.movieCast = cast;
    }
    return self;
}
@end
