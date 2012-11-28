//
//  KVOSampleViewController.h
//  KVOSample
//
//  Created by coodi8 on 11/28/12.
//  Copyright (c) 2012 099soft.com All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfile.h"

@interface KVOSampleViewController : UIViewController

@property (nonatomic, retain) UserProfile* user;
@property (nonatomic, retain) IBOutlet UILabel*  nameLabel;
@property (nonatomic, retain) IBOutlet UILabel*  ageLabel;
@property (nonatomic, retain) IBOutlet UILabel*  interstLabel;

- (IBAction)modifyData:(id)sender;
@end
