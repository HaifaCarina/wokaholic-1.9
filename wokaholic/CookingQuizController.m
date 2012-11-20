//
//  CookingQuizController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "CookingQuizController.h"
#import "AppDelegate.h"
@implementation CookingQuizController

- (void) tappedHome {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) tappedFacebook {
    facebookShare.hidden = YES;
    //createSnapshot
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGRect rect;
    rect = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width);
    CGImageRef imageRef = CGImageCreateWithImageInRect([viewImage CGImage], rect);
    
    UIImage *img = [UIImage imageWithCGImage:imageRef];
    UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
    CGImageRelease(imageRef);
    
    facebookShare.hidden = NO;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   img, @"source",
                                   @"I took the Wok-A-Holic Cooking Quiz and I'm on my way to becoming the master chef of my kitchen! Visit us on http://facebook.com/thelittlewhitebook or follow us through http://twitter.com/ElectroluxPH ", @"message",
                                   @"Electrolux Wok-A-Holic Cooking Quiz Result has been posted to your Facebook wall.", @"alertmessage",
                                   @"cookingquiz", @"category",
                                   nil];
    [appDelegate facebookSetParameters:params];
    
}
- (void) loadView {
    [super loadView];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width)];
	webView.scrollView.bounces = NO;
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cookingquiz" ofType:@"html" inDirectory:@"www"]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    //add the web view to the content view
	[self.view addSubview:webView];
    
    [webView release];
    
    self.view.backgroundColor =[UIColor blueColor];
    
    UIImage *fbImage = [UIImage imageNamed:@"facebook.png"];
    
    // Facebook Share button
    //facebookShare = [[UIImageView alloc] initWithFrame:CGRectMake(330, 700, fbImage.size.width, fbImage.size.height)];
    facebookShare = [[UIImageView alloc] initWithFrame:CGRectMake(835, 715, fbImage.size.width, fbImage.size.height)];
    facebookShare.image = fbImage;
    facebookShare.backgroundColor = [UIColor blueColor];
    //facebookShare.hidden = YES;
    [self.view addSubview:facebookShare];
    UITapGestureRecognizer *facebookTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedFacebook ) ];
    [facebookShare addGestureRecognizer:facebookTap];
    [facebookShare setUserInteractionEnabled:YES];
    [facebookTap release];
    
    
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

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight );
}
@end
