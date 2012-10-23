//
//  PDFViewController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "PDFViewController.h"


@implementation PDFViewController

- (void) tappedHome {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setFileName: (NSString *) name{
    NSLog(@"filename: %@", name);
    filename =  name;
}

- (void) loadView {
    [super loadView];
    self.navigationController.navigationBar.hidden = NO;
    //[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationPortrait];
    
    
    UIWebView *aWebView = [[UIWebView alloc]initWithFrame: CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height)];
	// Sets the scale of web content the first time it is displayed in a web view
	aWebView.scalesPageToFit = YES;
	[aWebView setDelegate:self];
	
	//Create a URL object.
    NSString *urlString = [NSString stringWithFormat:@"http://nmgdev.com/mobile/electrolux/pdf/%@",filename];
	NSURL *url = [NSURL URLWithString: urlString];
	
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//load the URL into the web view.
	[aWebView loadRequest:requestObj];
	
	[self.view addSubview:aWebView];
	[aWebView release];
    
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

- (void) viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
    self.navigationController.navigationBar.hidden = YES;
    //self.navigationController.navigationBar.hidden = NO;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown );
}
@end
