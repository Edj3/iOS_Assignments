//
//  Category.m
//  TopAlbumsExercise
//
//  Created by Unbounded on 4/19/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "Category.h"

@implementation Category
-(id)initWithLabel:(NSString *)label{
    self = [super init];
    if (self) {
        self.labelAtt = label;
    }
    return self;
}
@end
