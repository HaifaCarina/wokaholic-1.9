//
//  PhotoAppController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "PhotoAppController.h"
#import "AppDelegate.h"

@implementation PhotoAppController
@synthesize imgPicker, snapshot, spinner, pleaseWait;//, facebook; //, scrollView;

- (void) tappedHome {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) shoot{
    
    imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.delegate = self;
    imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    //imgPicker.allowsEditing = YES;
    imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    
    overlay = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"photoapp-male-crop.png"]];
    overlay.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    overlay.alpha = 0.5f;
    imgPicker.cameraOverlayView = overlay;
    
    imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    
    [self presentModalViewController:imgPicker animated:YES];
    
    UIDevice *currentDevice = [UIDevice currentDevice];
    
    while ([currentDevice isGeneratingDeviceOrientationNotifications])
        [currentDevice endGeneratingDeviceOrientationNotifications];
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
    
    shootButton.hidden = YES;
    
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
    back.hidden = NO;
    background.backgroundColor = [UIColor blackColor];
    background.image = nil;
    dishOptions.hidden = YES;
    genderOptions.hidden = YES;
    
    shareButton.hidden = YES;
    
    
}

- (void) tappedBack {
    NSLog(@"tapped back %@", currentPhoto);
    photoCaptured.image = currentPhoto;
    background.image = currentBackground;
    background.backgroundColor = [UIColor clearColor];
    snapshot.hidden = YES;
    facebookShare.hidden = YES;
    back.hidden = YES;
    dishOptions.hidden = NO;
    genderOptions.hidden = NO;
    shootButton.hidden = NO;
    shareButton.hidden = NO;
    
    
}

- (void) changeDetails {
    
    NSString *gender;
    NSString *dish;
    
    switch ([genderOptions selectedSegmentIndex]) {
        case 0:
            gender = @"male";
            overlay.image = [UIImage imageNamed:@"photoapp-male-crop.png"];
            photoScrollView.frame = CGRectMake(770, 60, 180, 180);
            imgPicker.cameraOverlayView = overlay;
            NSLog(@"change overlay to male");
            break;
        case 1:
            gender = @"female";
            overlay.image = [UIImage imageNamed:@"photoapp-female-crop.png"];
            photoScrollView.frame = CGRectMake(755, 65, 180, 180);
            imgPicker.cameraOverlayView = overlay;
            NSLog(@"change overlay to male");
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
    currentBackground = [UIImage imageNamed:fileName];
    
}

- (void) tappedFacebook {
    NSLog(@"postButtonClicked");
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    snapshot.image, @"source",
                                    @"I am the master chef of my Wok-A-Holic kitchen! Visit us on http://facebook.com/thelittlewhitebook or follow us through http://twitter.com/ElectroluxPH ", @"message",
                                   @"Electrolux Wok-A-Holic PhotoApp image has been posted to your Facebook wall.", @"alertmessage",
                                   @"photoapp",@"category",
                                    nil];
    [appDelegate facebookSetParameters:params];
    
    
}

- (void) loadView {
    NSLog(@"loadView");
    
    
    [super loadView];
    
    
    fileName = [[NSString alloc]initWithString:@"photoapp-male-parmesan-crusted-fish.png"]; //[NSString stringWithFormat:@"photoapp-male-parmesan-crusted-fish.png"];
    
    photoScrollView = [[UIScrollView alloc]initWithFrame: CGRectMake(770, 60, 180, 180)];
    photoScrollView.backgroundColor = [UIColor redColor];
    photoScrollView.scrollEnabled = YES;
    photoScrollView.showsHorizontalScrollIndicator = TRUE;
    photoScrollView.showsVerticalScrollIndicator = TRUE;
    photoScrollView.contentSize = CGSizeMake(300, 300);
    
    photoScrollView.delegate = self;
    photoScrollView.maximumZoomScale = 50;
    photoScrollView.minimumZoomScale = .2;
    
    
    photoCaptured = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 240, 180)];
    photoCaptured.backgroundColor = [UIColor grayColor];
    
    [photoScrollView addSubview:photoCaptured];
    [self.view addSubview:photoScrollView];
    
    
    background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"photoapp-male-parmesan-crusted-fish.png"]];
    background.backgroundColor = [UIColor clearColor];
    [self.view addSubview:background];
    //photoScrollView.alpha = 0.5f;
    
    
    currentBackground = [UIImage imageNamed:@"photoapp-male-parmesan-crusted-fish.png"];
    currentPhoto = [UIImage imageNamed:@"photoapp-male-parmesan-crusted-fish.png"]; //[[UIImage alloc]init];//
    
    shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[shareButton addTarget:self  action:@selector(createSnapshot) forControlEvents:UIControlEventTouchDown];
	[shareButton setTitle:@"Preview" forState:UIControlStateNormal];
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
    
    // Facebook Share button
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
    
    // BACK BUTTON
    back = [[UIImageView alloc] initWithFrame:CGRectMake(880, 700, 60, 54)];
    back.image = [UIImage imageNamed:@"back-button.png"];
    back.backgroundColor = [UIColor clearColor];
    back.hidden = YES;//tappedBackButton
    [self.view addSubview:back];
    UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedBack ) ];
    [back addGestureRecognizer:backTap];
    [back setUserInteractionEnabled:YES];
    [backTap release];
    
    pleaseWait = [[UILabel alloc]initWithFrame:CGRectMake(410, 580, 200, 40)];
    pleaseWait.textColor = [UIColor whiteColor];
    pleaseWait.backgroundColor = [UIColor clearColor];
    pleaseWait.text = @"Uploading. Please wait...";
    pleaseWait.hidden = YES;
    [self.view addSubview:pleaseWait];
    
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(self.view.frame.size.height/2, self.view.frame.size.width/2);
    spinner.hidesWhenStopped = YES; 
    [self.view addSubview:spinner];
    //[spinner startAnimating];
    NSLog(@"spinner has been initialized");
    
}

#pragma mark -
#pragma mark UIScrollView Delegate
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)aScrollView {
    return photoCaptured;
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
    
    UIImage * flippedImage = [UIImage imageWithCGImage:img.CGImage scale:img.scale orientation:UIImageOrientationDown];
    
    photoCaptured.image = flippedImage; //img;
    photoScrollView.contentSize = CGSizeMake((img.size.width*5) + img.size.width, (img.size.height*5) + img.size.height);
    currentPhoto = photoCaptured.image; //img;
    //photo.image = img;
    //photo.hidden = NO;
    background.hidden = NO;
    imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
	[imgPicker dismissModalViewControllerAnimated:YES];
    [imgPicker release];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight );
}



@end
