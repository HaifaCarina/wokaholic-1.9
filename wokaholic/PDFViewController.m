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
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight );
}
@end
