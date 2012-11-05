//
//  PhotoAppController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "PhotoAppController.h"

@implementation PhotoAppController
@synthesize imgPicker, snapshot; //, scrollView;

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
    facebookShare.hidden = NO;
    
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
    
    fileName = [NSString stringWithFormat:@"photoapp-%@-%@.png",gender,dish];
    background.image = [UIImage imageNamed:fileName];
    overlay.image = [UIImage imageNamed:fileName];
    
    
}

- (void) tappedFacebook {
    NSLog(@"tapped facebook");
}

- (void) loadView {
    [super loadView];
    
    imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.delegate = self;
    imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    fileName = [NSString stringWithFormat:@"photoapp-male-parmesan-crusted-fish.png"];
    overlay = [[UIImageView alloc] initWithImage:[UIImage imageNamed:fileName]];
    overlay.alpha = 0.5f;
    imgPicker.cameraOverlayView = overlay;
    
    photo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
    photo.backgroundColor = [UIColor clearColor];
    [self.view addSubview:photo];
    
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
    
    facebookShare = [[UIImageView alloc] initWithFrame:CGRectMake(120, 580, fbImage.size.width, fbImage.size.height)];
    facebookShare.image = fbImage;
    facebookShare.backgroundColor = [UIColor blueColor];
    facebookShare.hidden = YES;
    [self.view addSubview:facebookShare];
    UITapGestureRecognizer *facebookTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedFacebook ) ];
    [facebookShare addGestureRecognizer:facebookTap];
    [facebookShare setUserInteractionEnabled:YES];
    [facebookTap release];
    
    
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
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
    
    photo.image = img;
    photo.hidden = NO;
    background.hidden = NO;
	[picker dismissModalViewControllerAnimated:YES];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight || toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft );
}


@end
