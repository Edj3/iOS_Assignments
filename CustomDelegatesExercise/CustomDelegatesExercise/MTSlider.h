//
//  MTSlider.h
//  CustomDelegatesExercise
//
//  Created by Unbounded on 5/2/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTSlider;
@protocol MTSliderDelegate <NSObject>

@optional
-(void)MTSliderDidChange:(MTSlider*) MTSlider withValue:(CGFloat)value;

@required
-(CGFloat)startPositionForMTSlider:(MTSlider*)MTSlider;

@end

@interface MTSlider : UISlider
@property (weak,nonatomic) id <MTSliderDelegate> sliderDelegate;

-(id)initWithFrame:(CGRect)frame andDelegate:(id <MTSliderDelegate>)delegateObject;


@end
