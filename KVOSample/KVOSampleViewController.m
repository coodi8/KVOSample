//
//  KVOSampleViewController.m
//  KVOSample
//
//  Created by coodi8 on 11/28/12.
//  Copyright (c) 2012 099soft.com  All rights reserved.
//

#import "KVOSampleViewController.h"

@implementation KVOSampleViewController
@synthesize user;
@synthesize nameLabel;
@synthesize ageLabel;
@synthesize interstLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    user = [[UserProfile alloc] init];
    user.userName = @"咖啡猫";
    user.userAge  = 20;
    user.userProfilePath = @"";
    user.interstArray = [NSArray arrayWithObjects:@"游戏",@"财经",nil];
    
    [nameLabel setText:user.userName];
    [ageLabel setText:[NSString stringWithFormat:@"%d岁",user.userAge]];
    [interstLabel setText:[user.interstArray componentsJoinedByString:@","]];
    
    [self.user addObserver:self forKeyPath:@"userName" options:0 context:NULL];
    [self.user addObserver:self forKeyPath:@"userAge" options:NSKeyValueObservingOptionNew context:NULL];
    [self.user addObserver:self forKeyPath:@"userProfilePath" options:0 context:NULL];
    [self.user addObserver:self forKeyPath:@"interstArray" options:0 context:NULL];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)dealloc
{
    [self.user removeObserver:self forKeyPath:@"userName"];
    [self.user removeObserver:self forKeyPath:@"userAge"];
    [self.user removeObserver:self forKeyPath:@"userProfilePath"];
    [self.user removeObserver:self forKeyPath:@"interstArray"];
    
    [nameLabel release];
    [ageLabel release];
    [interstLabel release];
    [user release];
    [super dealloc];
}

#pragma mark Key Value Observing
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([object isKindOfClass:[UserProfile class]])
    {
        UserProfile* profile = (UserProfile*)object;
        if ([keyPath isEqualToString:@"userAge"])
        {
            NSString* ageString = [NSString stringWithFormat:@"%d岁",profile.userAge];
            [self.ageLabel setText:ageString];
        }else if([keyPath isEqualToString:@"userName"])
        {
            [self.nameLabel setText:profile.userName];
        }else if([keyPath isEqualToString:@"interstArray"])
        {
            [self.interstLabel setText:[profile.interstArray componentsJoinedByString:@","]];
        }
    }
}

- (IBAction)modifyData:(id)sender
{
    int tempAge = random()%200;
    self.user.userAge = tempAge;
    int num = random()%10000;
    self.user.userName = [NSString stringWithFormat:@"用户%d",num];
}

@end
