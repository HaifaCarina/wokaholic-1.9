//
//  AboutController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "AboutController.h"

@implementation AboutController

- (void) tappedHome {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) loadView {
    [super loadView];
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"about.jpg"]];
    background.backgroundColor = [UIColor clearColor];
    [self.view addSubview:background];
    
    // HOME BUTTON
    UIImageView *home = [[UIImageView alloc] initWithFrame:CGRectMake(10, 700, 60, 54)];
    home.image = [UIImage imageNamed:@"home-button.png"];
    home.backgroundColor = [UIColor clearColor];
    [self.view addSubview:home];
    UITapGestureRecognizer *homeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedHome ) ];
    [home addGestureRecognizer:homeTap];
    [home setUserInteractionEnabled:YES];
    [homeTap release];
}
@end
