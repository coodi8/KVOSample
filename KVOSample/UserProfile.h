//
//  UserProfile.h
//  KVOSample
//
//  Created by coodi8 on 11/28/12.
//  Copyright (c) 2012 099soft.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserProfile : NSObject

@property (nonatomic, retain) NSString*         userName;
@property (nonatomic, assign) int               userAge;
@property (nonatomic, retain) NSString*         userProfilePath;
@property (nonatomic, retain) NSMutableArray*   interstArray;
@end
