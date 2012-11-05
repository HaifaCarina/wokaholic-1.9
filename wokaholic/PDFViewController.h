//
//  PDFViewController.h
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFViewController : UIViewController <UIWebViewDelegate> {
    NSString *filename;
    UIScrollView *photoScrollView;
    UIImageView *imageView;
}
- (void)setFileName: (NSString *) name;
@end
