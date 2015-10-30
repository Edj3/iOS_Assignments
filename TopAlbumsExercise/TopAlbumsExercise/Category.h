//
//  Category.h
//  TopAlbumsExercise
//
//  Created by Unbounded on 4/19/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Category : NSObject
@property (strong,nonatomic) NSString *labelAtt;
-(id)initWithLabel: (NSString*) label;
@end
