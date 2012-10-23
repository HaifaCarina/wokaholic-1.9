//
//  RecipesController.h
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h" 
@interface RecipesController : UIViewController <iCarouselDataSource, iCarouselDelegate> {
	iCarousel *carousel;
}

@end
