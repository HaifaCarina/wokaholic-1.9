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
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
	webView.autoresizesSubviews = YES;
	webView.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    webView.dataDetectorTypes = UIDataDetectorTypeLink;
    //webView.backgroundColor = [UIColor redColor];
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:filename ofType:@"pdf" inDirectory:@"www"]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    //add the web view to the content view
	[self.view addSubview:webView];
    
    [webView release];

}

- (void) viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
    self.navigationController.navigationBar.hidden = YES;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight );
}
@end
