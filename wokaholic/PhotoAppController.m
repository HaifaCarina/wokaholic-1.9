//
//  PhotoAppController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "PhotoAppController.h"

@implementation PhotoAppController
@synthesize imgPicker, snapshot, facebook; //, scrollView;

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
    back.hidden = NO;
    background.backgroundColor = [UIColor blackColor];
    background.image = nil;
    dishOptions.hidden = YES;
    genderOptions.hidden = YES;
    shootButton.hidden = YES;
    shareButton.hidden = YES;
    
    
}

- (void) tappedBack {
    NSLog(@"tapped back %@", currentBackground);
    background.image = currentBackground;
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
    currentBackground = [UIImage imageNamed:fileName];
    
}

- (void) tappedFacebook {
    NSLog(@"postButtonClicked");
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"]
        && [defaults objectForKey:@"FBExpirationDateKey"]) {
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    
    if (![facebook isSessionValid]) {
        NSLog(@"START sSessionValid");
        NSArray *permissions = [[NSArray alloc] initWithObjects:
                                @"user_likes",
                                @"read_stream",@"user_about_me", @"publish_stream", @"user_photos",
                                nil];
        [facebook authorize:permissions];
        NSLog(@"PERMISSION DONE");
        [permissions release];
        //UIImage *image = [UIImage imageNamed:@"home-button.png"];
        NSMutableDictionary *params1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                        snapshot.image, @"source",
                                        @"caption desc", @"message",
                                        nil];
        [facebook requestWithGraphPath:@"/me/photos"
                             andParams:params1 andHttpMethod:@"POST" andDelegate:self];
        NSLog(@"REQUEST DONE");
    } else {
        NSLog(@"post again");
        NSMutableDictionary *params1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                        snapshot.image, @"source",
                                        @"caption desc", @"message",
                                        nil];
        [facebook requestWithGraphPath:@"/me/photos"
                             andParams:params1 andHttpMethod:@"POST" andDelegate:self];
    }
    NSLog(@"END sSessionValid");
    
    [spinner startAnimating];
}

- (void) loadView {
    facebook = [[Facebook alloc] initWithAppId:@"473718806005934" andDelegate:self];
    
    [super loadView];
    
    
    imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.delegate = self;
    imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imgPicker.allowsEditing = YES;
    imgPicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    
    fileName = [[NSString alloc]initWithString:@"photoapp-male-parmesan-crusted-fish.png"]; //[NSString stringWithFormat:@"photoapp-male-parmesan-crusted-fish.png"];
    overlay = [[UIImageView alloc] initWithImage:[UIImage imageNamed:fileName]];
    overlay.alpha = 0.5f;
    //imgPicker.cameraOverlayView = overlay;
    
    photo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width)];
    photo.backgroundColor = [UIColor clearColor];
    [self.view addSubview:photo];
    
    photoScrollView = [[UIScrollView alloc]initWithFrame: CGRectMake(800, 70, 150, 150)];
    photoScrollView.backgroundColor = [UIColor redColor];
    photoScrollView.scrollEnabled = YES;
    photoScrollView.showsHorizontalScrollIndicator = TRUE;
    photoScrollView.showsVerticalScrollIndicator = TRUE;
    photoScrollView.contentSize = CGSizeMake(300, 300);
    
    photoScrollView.delegate = self;
    photoScrollView.maximumZoomScale = 50;
    photoScrollView.minimumZoomScale = .2;
    
    
    photoCaptured = [[UIImageView alloc]initWithFrame:CGRectMake(photoScrollView.frame.size.width*.15, photoScrollView.frame.size.height*.15, 150, 150)];
    photoCaptured.backgroundColor = [UIColor yellowColor];
    photoCaptured.image = [UIImage imageNamed:@"photoapp-female-chicken-scaloppine-with-spinach-and-linguine.png"];
    [photoScrollView addSubview:photoCaptured];
    [self.view addSubview:photoScrollView];
    
    
    background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"photoapp-male-parmesan-crusted-fish.png"]];
    background.backgroundColor = [UIColor clearColor];
    [self.view addSubview:background];
    
    
    currentBackground = [UIImage imageNamed:@"photoapp-male-parmesan-crusted-fish.png"];
    
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
    
    
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake(self.view.frame.size.height/2, self.view.frame.size.width/2);
    spinner.hidesWhenStopped = YES; 
    [self.view addSubview:spinner];
    
}


#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
    photoCaptured.image = img;
    photoScrollView.contentSize = CGSizeMake((img.size.width*5) + img.size.width, (img.size.height*5) + img.size.height);
    
    photo.image = img;
    photo.hidden = NO;
    background.hidden = NO;
	[picker dismissModalViewControllerAnimated:YES];
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight || toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft );
}

#pragma mark -
#pragma mark Facebook Methods

- (void)fbDidLogin {
    NSLog(@"fbDidLogin ");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
    
    //UIImage *image = [UIImage imageNamed:@"home-button.png"];
    NSLog(@"PLEASE WOOOOORK! T___T ");
    NSMutableDictionary *params1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    snapshot.image, @"source",
                                    @"Yeheeey!", @"message",
                                    nil];
    [facebook requestWithGraphPath:@"/me/photos"
                         andParams:params1 andHttpMethod:@"POST" andDelegate:self];
    NSLog(@"YEY! IT WORKED! T___T ");
        
}
- (void) fbDidLogout {
    NSLog(@"fbDidLogout ");
    // Remove saved authorization information if it exists
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"]) {
        [defaults removeObjectForKey:@"FBAccessTokenKey"];
        [defaults removeObjectForKey:@"FBExpirationDateKey"];
        [defaults synchronize];
    }
}

-(void)request:(FBRequest *)request didLoad:(id)result {
    NSLog(@"Request didLoad: %@ ", [request url ]);
    if ([result isKindOfClass:[NSArray class]]) {
        result = [result objectAtIndex:0];
    }
    if ([result isKindOfClass:[NSDictionary class]]){
        
    }
    if ([result isKindOfClass:[NSData class]]) {
    }
    NSLog(@"request returns %@",result);
    [spinner stopAnimating];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Success"
                          message: @"PhotoApp snapshot has been posted to your Facebook wall."
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}




@end
