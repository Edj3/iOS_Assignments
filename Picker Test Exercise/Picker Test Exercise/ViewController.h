//
//  ViewController.h
//  Picker Test Exercise
//
//  Created by Unbounded on 4/4/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *myPicker;

@end
