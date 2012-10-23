//
//  PhotoAppController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "PhotoAppController.h"

@implementation PhotoAppController
@synthesize imgPicker, snapshot, scrollView;

- (void) tappedHome {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) shoot{
    imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentModalViewController:imgPicker animated:YES];
}

- (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    
	CGImageRef maskRef = maskImage.CGImage;
    
	CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
	CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
	return [UIImage imageWithCGImage:masked];
    
}

- (void) createSnapshot {
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGRect rect;
    rect = CGRectMake(270, 10, 744, 426);
    CGImageRef imageRef = CGImageCreateWithImageInRect([viewImage CGImage], rect);
    
    UIImage *img = [UIImage imageWithCGImage:imageRef];
    UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
    CGImageRelease(imageRef);
    
    snapshot.image = img;
    [snapshot.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [snapshot.layer setBorderWidth: 5.0];
    snapshot.hidden = NO;
    facebook.hidden = NO;
    
    background.backgroundColor = [UIColor blackColor];
    background.image = nil;
    dishOptions.hidden = YES;
    genderOptions.hidden = YES;
    shootButton.hidden = YES;
    shareButton.hidden = YES;
    
    
}

- (void) changeDetails {
    
    NSString *gender;
    NSString *dish;
    
    switch ([genderOptions selectedSegmentIndex]) {
        case 0:
            gender = @"male";
            break;
        case 1:
            gender = @"female";
            break;
    }
    
    switch ([dishOptions selectedSegmentIndex]) {
        case 0:
            dish = @"parmesan-crusted-fish";
            break;
        case 1:
            dish = @"chicken-scaloppine-with-spinach-and-linguine";
            break;
        case 2:
            dish = @"sherry-apple-pork-chops";
            break;
    }
    
    NSString *fileName = [NSString stringWithFormat:@"photoapp-%@-%@.png",gender,dish];
    background.image = [UIImage imageNamed:fileName];
    
}


- (void) loadView {
    [super loadView];
    
    imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.allowsEditing = YES;
    imgPicker.delegate = self;
    imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    maskedImage = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    maskedImage.contentMode = UIViewContentModeTop;
    
    scrollView = [[UIScrollView alloc]initWithFrame: CGRectMake(820, 100, 200, 250) ];
    scrollView.delegate = self;
    scrollView.minimumZoomScale=0.02;
    scrollView.maximumZoomScale=60.0;
    scrollView.scrollEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = TRUE;
    scrollView.showsVerticalScrollIndicator = TRUE;
    scrollView.contentSize = CGSizeMake([UIImage imageNamed:@"photoapp-male-parmesan-crusted-fish.png"].size.width , [UIImage imageNamed:@"photoapp-male-parmesan-crusted-fish.png"].size.height );
    [scrollView addSubview:maskedImage];
    [self.view addSubview:scrollView];
    
    background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"photoapp-male-parmesan-crusted-fish.png"]];
    background.backgroundColor = [UIColor clearColor];
    [self.view addSubview:background];
    
    shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[shareButton addTarget:self  action:@selector(createSnapshot) forControlEvents:UIControlEventTouchDown];
	[shareButton setTitle:@"Final" forState:UIControlStateNormal];
    shareButton.frame = CGRectMake(850.0, 470.0, 100.0,100.0);
    [self.view addSubview:shareButton];
    
    shootButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[shootButton addTarget:self  action:@selector(shoot) forControlEvents:UIControlEventTouchDown];
	[shootButton setImage:[UIImage imageNamed:@"capture.png"] forState:UIControlStateNormal];
    shootButton.frame = CGRectMake(556.0 , 368.0, 160.0 ,60.0);
    shootButton.tag = 3;
	[self.view addSubview:shootButton];
    
    snapshot = [[UIImageView alloc] initWithFrame:CGRectMake(120 , 140, 744, 426)];
    snapshot.backgroundColor = [UIColor blueColor];
    snapshot.hidden = YES;
    [self.view addSubview:snapshot];
    UIImage *fbImage = [UIImage imageNamed:@"facebook.png"];
    
    facebook = [[UIImageView alloc] initWithFrame:CGRectMake(120, 580, fbImage.size.width, fbImage.size.height)];
    facebook.image = fbImage;
    facebook.backgroundColor = [UIColor blueColor];
    facebook.hidden = YES;
    [self.view addSubview:facebook];
    
    
    UIFont *font = [UIFont boldSystemFontOfSize:14.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:UITextAttributeFont];
    
    NSArray *genderArray = [NSArray arrayWithObjects: @"Male", @"Female",  nil];
    genderOptions = [[UISegmentedControl alloc] initWithItems:genderArray];
    genderOptions.frame = CGRectMake(360, 500, 420, 50);
    genderOptions.segmentedControlStyle = UISegmentedControlStylePlain;
    genderOptions.selectedSegmentIndex = 0;
    [genderOptions setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.view addSubview:genderOptions];
    [genderOptions addTarget:self action:@selector(changeDetails) forControlEvents:UIControlEventValueChanged];
    [genderOptions release];
    
    NSArray *dishArray = [NSArray arrayWithObjects: @"Parmesan Crusted Fish", @"Chicken Scaloppine with Spinach and Linguine", @"Sherry Apple Pork Chops", nil];
    dishOptions = [[UISegmentedControl alloc] initWithItems:dishArray];
    dishOptions.frame = CGRectMake(280, 620, 720, 50);
    dishOptions.segmentedControlStyle = UISegmentedControlStylePlain;
    dishOptions.selectedSegmentIndex = 0;
    [dishOptions setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [dishOptions setWidth:180.00 forSegmentAtIndex:0];
    [dishOptions setWidth:340.00 forSegmentAtIndex:1];
    [self.view addSubview:dishOptions];
    [dishOptions addTarget:self action:@selector(changeDetails) forControlEvents:UIControlEventValueChanged];
    [dishOptions release];
    
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


#pragma mark -
#pragma mark UIScrollView Delegate
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    
}
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)aScrollView {
    NSLog(@"%d",aScrollView.tag);
    
    return maskedImage;
}
- (void)scrollViewDidEndZooming:(UIScrollView *)zoomedScrollView withView:(UIView *)view atScale:(float)scale
{
    NSLog(@"%f ", scale);
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
    
    scrollView.contentSize = img.size;
    maskedImage.image = img;
	[picker dismissModalViewControllerAnimated:YES];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}


@end
