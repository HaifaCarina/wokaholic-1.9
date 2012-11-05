//
//  RecipesController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "RecipesController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface RecipesController () <UIActionSheetDelegate>
@property (nonatomic, retain) NSArray *appetizersArray;
@property (nonatomic, retain) NSArray *mainCourseArray;
@property (nonatomic, retain) NSArray *dessertArray;
@end

@implementation RecipesController
@synthesize appetizersArray, mainCourseArray, dessertArray;
- (void) tappedHome {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) tappedMenu: (UITapGestureRecognizer *) sender {
    
    NSLog(@"tapped appetizers tag: %d", sender.view.tag);
    
    switch (sender.view.tag) {
        case 1:
        {
            currentCarousel = 1;
            carouselAppetizer.hidden = NO;
            carouselMain.hidden = YES;
            carouselDessert.hidden = YES;
            break;
        }
        case 2:
        {
            currentCarousel = 2;
            carouselAppetizer.hidden = YES;
            carouselMain.hidden = NO;
            carouselDessert.hidden = YES;
            break;
        }
        case 3:
        {
            currentCarousel = 3;
            carouselAppetizer.hidden = YES;
            carouselMain.hidden = YES;
            carouselDessert.hidden = NO;
            break;
        }
    }
}

- (void) loadView {
    [super loadView];
    
    self.navigationController.navigationBar.hidden = YES;
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"recipes-bg.png"]];
    background.backgroundColor = [UIColor clearColor];
    [self.view addSubview:background];
    
    UILabel *appetizers = [[UILabel alloc] initWithFrame:CGRectMake(20 , 30, 150, 20 + 10)];
    [appetizers setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
    appetizers.text = @"Appetizers";
    appetizers.textColor = UIColorFromRGB(0x6d1315);
    appetizers.backgroundColor = [UIColor clearColor];
    appetizers.tag = 1;
    [self.view addSubview:appetizers];
    UITapGestureRecognizer *tapAppetizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedMenu: ) ];
    [appetizers addGestureRecognizer:tapAppetizer];
    [appetizers setUserInteractionEnabled:YES];
    [tapAppetizer release];
    
    
    UILabel *mainCourse = [[UILabel alloc] initWithFrame:CGRectMake(20, 30 + 40, 150, 20 + 10)];
    [mainCourse setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
    mainCourse.text = @"Main Course";
    mainCourse.textColor = UIColorFromRGB(0x6d1315);
    mainCourse.backgroundColor = [UIColor clearColor];
    
    mainCourse.tag = 2;
    [self.view addSubview:mainCourse];
    UITapGestureRecognizer *tapMain = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedMenu: ) ];
    [mainCourse addGestureRecognizer:tapMain];
    [mainCourse setUserInteractionEnabled:YES];
    [tapMain release];
    
    UILabel *desserts = [[UILabel alloc] initWithFrame:CGRectMake(20, 30 + 40 + 40, 150, 20 + 10)];
    desserts.textColor = UIColorFromRGB(0x6d1315);
    [desserts setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
    desserts.text = @"Desserts";
    desserts.backgroundColor = [UIColor clearColor];
    desserts.tag = 3;
    [self.view addSubview:desserts];
    UITapGestureRecognizer *tapDessert = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedMenu: ) ];
    [desserts addGestureRecognizer:tapDessert];
    [desserts setUserInteractionEnabled:YES];
    [tapDessert release];
    
    // HOME BUTTON
    UIImageView *home = [[UIImageView alloc] initWithFrame:CGRectMake(950, 700, 60, 54)];
    home.image = [UIImage imageNamed:@"home-button.png"];
    home.backgroundColor = [UIColor clearColor];
    [self.view addSubview:home];
    UITapGestureRecognizer *homeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedHome ) ];
    [home addGestureRecognizer:homeTap];
    [home setUserInteractionEnabled:YES];
    [homeTap release];
    
    appetizersArray = [NSArray arrayWithObjects:
                                [UIImage imageNamed:@"appetizer-thumb-1.png"],
                                [UIImage imageNamed:@"appetizer-thumb-2.png"],
                                [UIImage imageNamed:@"appetizer-thumb-3.png"],
                                [UIImage imageNamed:@"appetizer-thumb-4.png"],
                                [UIImage imageNamed:@"appetizer-thumb-5.png"],
                                [UIImage imageNamed:@"appetizer-thumb-6.png"],
                                [UIImage imageNamed:@"appetizer-thumb-7.png"],
                                [UIImage imageNamed:@"appetizer-thumb-8.png"],
                                [UIImage imageNamed:@"appetizer-thumb-9.png"],
                                [UIImage imageNamed:@"appetizer-thumb-10.png"],nil];
    mainCourseArray = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"main-thumb-1.png"],
                       [UIImage imageNamed:@"main-thumb-2.png"],
                       [UIImage imageNamed:@"main-thumb-3.png"],
                       [UIImage imageNamed:@"main-thumb-4.png"],
                       [UIImage imageNamed:@"main-thumb-5.png"],
                       [UIImage imageNamed:@"main-thumb-6.png"],
                       [UIImage imageNamed:@"main-thumb-7.png"],
                       [UIImage imageNamed:@"main-thumb-8.png"],
                       [UIImage imageNamed:@"main-thumb-9.png"],
                       [UIImage imageNamed:@"main-thumb-10.png"],
                       [UIImage imageNamed:@"main-thumb-11.png"],
                       [UIImage imageNamed:@"main-thumb-12.png"],
                       [UIImage imageNamed:@"main-thumb-13.png"],
                       [UIImage imageNamed:@"main-thumb-14.png"],
                       [UIImage imageNamed:@"main-thumb-15.png"],nil];
    
    dessertArray = [NSArray arrayWithObjects:
                                [UIImage imageNamed:@"dessert-thumb-1.png"],
                                [UIImage imageNamed:@"dessert-thumb-2.png"],
                                [UIImage imageNamed:@"dessert-thumb-3.png"],
                                [UIImage imageNamed:@"dessert-thumb-4.png"],
                                [UIImage imageNamed:@"dessert-thumb-5.png"],
                                [UIImage imageNamed:@"dessert-thumb-7.png"],
                                [UIImage imageNamed:@"dessert-thumb-7.png"], nil];
    
    
    carouselAppetizer = [[iCarousel alloc] initWithFrame:CGRectMake(310, 235, 280, 160) ];
	carouselAppetizer.tag = 1;
    carouselAppetizer.type = iCarouselTypeRotary;
	carouselAppetizer.dataSource = self;
	carouselAppetizer.delegate = self;
    carouselAppetizer.hidden = NO;
    [self.view addSubview:carouselAppetizer];
    
    carouselMain = [[iCarousel alloc] initWithFrame:CGRectMake(310, 235, 280, 160) ];
	carouselMain.tag = 2;
    carouselMain.type = iCarouselTypeRotary;
	carouselMain.dataSource = self;
	carouselMain.delegate = self;
    carouselMain.hidden = YES;
    [self.view addSubview:carouselMain];
    
    carouselDessert = [[iCarousel alloc] initWithFrame:CGRectMake(310, 235, 280, 160) ];
	carouselDessert.tag = 3;
    carouselDessert.type = iCarouselTypeRotary;
	carouselDessert.dataSource = self;
	carouselDessert.delegate = self;
    carouselDessert.hidden = YES;
    [self.view addSubview:carouselDessert];
    
    currentCarousel = 1;
}


- (void)carousel: (iCarousel *)_carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"Did select item at index %d", index); // sample
    
    PDFViewController *aController = [[PDFViewController alloc]init];
    NSString *filename;
    switch (_carousel.tag) {
        case 1:
        {
            filename = [NSString stringWithFormat:@"appetizer-%d", index + 1];
            break;
        }
        case 2:
        {
            filename = [NSString stringWithFormat:@"main-%d", index + 1];
            break;
        }
        case 3:
        {
            filename = [NSString stringWithFormat:@"dessert-%d", index + 1];
            break;
        }
    }
    
    
    [aController setFileName:filename];
    [self.navigationController pushViewController:aController animated:YES];
    [aController release];
    
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)_carousel
{
    switch (_carousel.tag) {
        case 1:
        {
            return [appetizersArray count];
            break;
        }
        case 2:
        {
            return [mainCourseArray count];
            break;
        }
        case 3:
        {
            return [dessertArray count];
            break;
        }
    }
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIView *)carousel:(iCarousel *)_carousel viewForItemAtIndex:(NSUInteger)index
{
    NSLog(@"CAROUSEL TAG: %d", _carousel.tag);
    UIImage *image;
    switch (_carousel.tag) {
        case 1:
        {
            image = [appetizersArray objectAtIndex:index];
            break;
        }
        case 2:
        {
            image = [mainCourseArray objectAtIndex:index];
            break;
        }
        case 3:
        {
            image = [dessertArray objectAtIndex:index];
            break;
        }
    }
    NSLog(@"%f, %f",image.size.width, image.size.height);
    
    UIButton *button = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)] autorelease];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [button.titleLabel.font fontWithSize:50];
    button.tag=index;
    return button;
    
	
}
- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    //wrap all carousels
    return YES;
	
}


- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    //slightly wider than item view
    return 250;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight || toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft );
}

@end
