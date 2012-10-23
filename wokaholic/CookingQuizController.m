//
//  CookingQuizController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "CookingQuizController.h"

@implementation CookingQuizController

- (void) tappedHome {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) loadView {
    [super loadView];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
	webView.autoresizesSubviews = YES;
	webView.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    webView.dataDetectorTypes = UIDataDetectorTypeLink;
    webView.backgroundColor = [UIColor redColor];
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cookingquiz" ofType:@"html" inDirectory:@"www"]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    //add the web view to the content view
	[self.view addSubview:webView];
    
    [webView release];
    
    self.view.backgroundColor =[UIColor blueColor];
    
    // HOME BUTTON
    UIImageView *home = [[UIImageView alloc] initWithFrame:CGRectMake(950, 700, 60, 54)];
    home.image = [UIImage imageNamed:@"home-button.png"];
    home.backgroundColor = [UIColor clearColor];
    [self.view addSubview:home];
    UITapGestureRecognizer *homeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedHome ) ];
    [home addGestureRecognizer:homeTap];
    [home setUserInteractionEnabled:YES];
    [homeTap release];
}

@end
