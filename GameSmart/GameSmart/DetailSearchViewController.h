//
//  DetailSearchViewController.h
//  GameSmart
//
//  Created by Unbounded on 4/30/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameManager.h"

@interface DetailSearchViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *detailSearchImage;
@property (weak, nonatomic) IBOutlet UITextView *detailSearchView;

@end
