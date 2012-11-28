//
//  UserProfile.m
//  KVOSample
//
//  Created by coodi8 on 11/28/12.
//  Copyright (c) 2012 099soft.com All rights reserved.
//

#import "UserProfile.h"

@implementation UserProfile
@synthesize userName;
@synthesize userAge;
@synthesize userProfilePath;
@synthesize interstArray;
- (id)init
{
    self = [super init];
    if (self) 
    {
        interstArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [interstArray removeAllObjects];
    [interstArray release];
    [super dealloc];
}
@end
