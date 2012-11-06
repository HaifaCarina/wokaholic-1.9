//
//  ProductGuideController.h
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductGuideController : UIViewController <UIScrollViewDelegate> {
    UIImageView *background;
    UILabel *main;
    UILabel *gallery;
    UILabel *specs;
    NSInteger currentProduct;
    UILabel *crGallerySS;
    UILabel *crGallerySS50;
    UILabel *crGallerySS60;
    UILabel *crGallerySS90;
    UILabel *crGalleryBS;
    UILabel *crGalleryBS50;
    
    UILabel *crSpecsSS;
    UILabel *crSpecsBS;
    
    UILabel *hoodsGallerySL;
    UILabel *hoodsGallerySL60;
    UILabel *hoodsGallerySL90;
    UILabel *hoodsGalleryC;
    
    UILabel *hoodsSpecsSL;
    UILabel *hoodsSpecsSL60;
    UILabel *hoodsSpecsSL90;
    UILabel *hoodsSpecsC;
    
    UIImageView *dishwasherOptions;
    UIImageView *builtinOption;
    UIImageView *compactOption;
    
    UIScrollView *photoScrollView;
    UIView *container;
}

@end
