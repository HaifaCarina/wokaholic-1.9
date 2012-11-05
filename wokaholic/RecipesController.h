//
//  RecipesController.h
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h" 
#import "PDFViewController.h"
#import "CustomUILabel.h"
@interface RecipesController : UIViewController <iCarouselDataSource, iCarouselDelegate> {
	iCarousel *carouselMain;
    iCarousel *carouselAppetizer;
    iCarousel *carouselDessert;
    NSInteger currentCarousel;
    CustomUILabel *appetizers;
    CustomUILabel *mainCourse;
    CustomUILabel *desserts;
}

@end
