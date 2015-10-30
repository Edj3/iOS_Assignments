//
//  ViewController.h
//  Page App
//
//  Created by Unbounded on 4/2/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong,nonatomic) id dataObject1;
@property (strong,nonatomic) id dataObject2;
@property (weak, nonatomic) IBOutlet UILabel *titleString;
@property (weak, nonatomic) IBOutlet UILabel *textString;

@end
