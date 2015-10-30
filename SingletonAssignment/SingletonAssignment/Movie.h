//
//  Movie.h
//  SingletonAssignment
//
//  Created by Unbounded on 4/12/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
@property (strong,nonatomic) NSString *movietitle;
@property (strong,nonatomic) NSString *movieYear;
@property (strong,nonatomic) UITextView *movieCast;

-(id)initWithMovieTitle: (NSString*) title
              MovieYear: (NSString*) year
              MovieCast:(UITextView*) cast;
@end
