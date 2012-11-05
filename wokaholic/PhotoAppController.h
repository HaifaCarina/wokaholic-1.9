//
//  PhotoAppController.h
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Facebook.h"
@interface PhotoAppController : UIViewController <UIImagePickerControllerDelegate , UINavigationControllerDelegate, UIScrollViewDelegate, FBSessionDelegate, FBDialogDelegate,FBRequestDelegate> {
    UIImagePickerController *imgPicker;
    UIImageView *snapshot;

    UIImageView *background;
    UISegmentedControl *dishOptions;
    UISegmentedControl *genderOptions;
    UIButton *shareButton;
    UIButton *shootButton;
    UIImageView *facebookShare;
    UIImageView *photo;
    NSString *fileName;
    UIImageView *overlay;
    Facebook *facebook;
}

@property (nonatomic, retain) UIImagePickerController *imgPicker;
@property (nonatomic, retain) UIImageView *snapshot;
@property (nonatomic, retain) Facebook *facebook;
@end
