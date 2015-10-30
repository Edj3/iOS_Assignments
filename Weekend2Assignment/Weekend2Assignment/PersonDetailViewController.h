//
//  PersonDetailViewController.h
//  Weekend2Assignment
//
//  Created by Unbounded on 4/6/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "MyManager.h"

@interface PersonDetailViewController : UIViewController <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *detailLastName;
@property (strong, nonatomic) IBOutlet UILabel *detailFirstName;
@property (weak, nonatomic) IBOutlet UILabel *detailMidName;
@property (weak, nonatomic) IBOutlet UILabel *detailDepartName;
@property (weak, nonatomic) IBOutlet UILabel *detailDOB;
@property (strong,nonatomic) Person *collectPerson;
@end
