//
//  PDFViewController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "PDFViewController.h"
#import "AppDelegate.h"

@implementation PDFViewController

- (void) tappedHome {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setFileName: (NSString *) name{
    NSLog(@"filename: %@", name);
    filename =  name;
}

- (void) shareAction {
    NSLog(@"share action %@", imageView.image);
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   imageView.image, @"source",
                                   @"I just cooked a delicious dish from from the Wok-A-Holic list of recipes by Chef Bruce Lim! Visit us on http://facebook.com/thelittlewhitebook or follow us through http://twitter.com/ElectroluxPH ", @"message",
                                   @"Electrolux Wok-A-Holic Recipe image has been posted to your Facebook wall.", @"alertmessage",
                                   @"recipes",@"category",
                                   nil];
    [appDelegate facebookSetParameters:params];
    
}
- (void) loadView {
    [super loadView];
    self.navigationController.navigationBar.hidden = NO;
    
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Share"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(shareAction)];
    
    self.navigationItem.rightBarButtonItem = shareButton;
    [shareButton release];
    

    NSString *imageString = [NSString stringWithFormat:@"%@.png", filename];
    UIImage *image = [UIImage imageNamed:imageString];
    
    photoScrollView = [[UIScrollView alloc]initWithFrame: CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
    photoScrollView.backgroundColor = [UIColor clearColor];
    photoScrollView.scrollEnabled = YES;
    photoScrollView.showsHorizontalScrollIndicator = TRUE;
    photoScrollView.showsVerticalScrollIndicator = TRUE;
    CGFloat height = (image.size.height*self.view.frame.size.height)/self.view.frame.size.width;
    photoScrollView.contentSize = CGSizeMake(image.size.width, height + 40);
    
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, height )];
    imageView.backgroundColor = [UIColor blueColor];
    imageView.image = image;
    [photoScrollView addSubview:imageView];
    
    [self.view addSubview:photoScrollView];

}

- (void) viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
    self.navigationController.navigationBar.hidden = YES;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight);
}
@end
