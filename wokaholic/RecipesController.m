//
//  RecipesController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "RecipesController.h"

@interface RecipesController () <UIActionSheetDelegate>
@property (nonatomic, retain) NSArray *items;
@property (nonatomic, retain) NSArray *appetizersArray;
@property (nonatomic, retain) NSArray *mainCourseArray;
@property (nonatomic, retain) NSArray *dessertsArray;
@end

@implementation RecipesController
@synthesize items, appetizersArray, mainCourseArray, dessertsArray;
- (void) tappedHome {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) tappedAppetizers: (UITapGestureRecognizer *) sender {
    
    NSLog(@"tapped appetizers tag: %d", sender.view.tag);
    
    
}

- (void) loadView {
    [super loadView];
    
    self.navigationController.navigationBar.hidden = YES;
    //[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeLeft];
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"recipes-bg.png"]];
    background.backgroundColor = [UIColor clearColor];
    [self.view addSubview:background];
    
    UILabel *appetizers = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 100, 20)];
    appetizers.text = @"Appetizers";
    appetizers.backgroundColor = [UIColor clearColor];
    appetizers.tag = 1;
    [self.view addSubview:appetizers];
    UITapGestureRecognizer *tapAction = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedAppetizers: ) ];
    [appetizers addGestureRecognizer:tapAction];
    [appetizers setUserInteractionEnabled:YES];
    [tapAction release];
    
    UILabel *mainCourse = [[UILabel alloc] initWithFrame:CGRectMake(20, 30 + 20, 100, 20)];
    mainCourse.text = @"Main Course";
    mainCourse.backgroundColor = [UIColor clearColor];
    mainCourse.tag = 2;
    [self.view addSubview:mainCourse];
    
    UILabel *desserts = [[UILabel alloc] initWithFrame:CGRectMake(20, 30 + 20 + 20, 100, 20)];
    desserts.text = @"Desserts";
    desserts.backgroundColor = [UIColor clearColor];
    desserts.tag = 3;
    [self.view addSubview:desserts];
    
    // HOME BUTTON
    UIImageView *home = [[UIImageView alloc] initWithFrame:CGRectMake(950, 700, 60, 54)];
    home.image = [UIImage imageNamed:@"home-button.png"];
    home.backgroundColor = [UIColor clearColor];
    [self.view addSubview:home];
    UITapGestureRecognizer *homeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedHome ) ];
    [home addGestureRecognizer:homeTap];
    [home setUserInteractionEnabled:YES];
    [homeTap release];
    /*
    appetizersArray = [NSArray arrayWithObjects:
                                [UIImage imageNamed:@"appetizer-1.jpg"],
                                [UIImage imageNamed:@"appetizer-2.jpg"],
                                [UIImage imageNamed:@"appetizer-3.jpg"],
                                [UIImage imageNamed:@"appetizer-4.jpg"],
                                [UIImage imageNamed:@"appetizer-5.jpg"], nil];
    mainCourseArray = [NSArray arrayWithObjects:
                                [UIImage imageNamed:@"main-1.jpg"],
                                [UIImage imageNamed:@"main-2.jpg"],
                                [UIImage imageNamed:@"main-3.jpg"],
                                [UIImage imageNamed:@"main-4.jpg"],
                                [UIImage imageNamed:@"main-5.jpg"], nil];
    
    dessertsArray = [NSArray arrayWithObjects:
                                [UIImage imageNamed:@"dessert-1.jpg"],
                                [UIImage imageNamed:@"dessert-2.jpg"],
                                [UIImage imageNamed:@"dessert-3.jpg"],
                                [UIImage imageNamed:@"dessert-4.jpg"],
                                [UIImage imageNamed:@"dessert-5.jpg"], nil];
    */
    // The items to be displayed in the carousel
	items = [NSArray arrayWithObjects:
             [UIImage imageNamed:@"main-1.jpg"],
			 [UIImage imageNamed:@"main-2.jpg"],
			 [UIImage imageNamed:@"main-3.jpg"],
			 [UIImage imageNamed:@"main-4.jpg"],
			 [UIImage imageNamed:@"main-5.jpg"],
             [UIImage imageNamed:@"appetizer-1.jpg"],
			 [UIImage imageNamed:@"appetizer-2.jpg"],
			 [UIImage imageNamed:@"appetizer-3.jpg"],
			 [UIImage imageNamed:@"appetizer-4.jpg"],
			 [UIImage imageNamed:@"appetizer-5.jpg"],
             [UIImage imageNamed:@"dessert-1.jpg"],
			 [UIImage imageNamed:@"dessert-2.jpg"],
			 [UIImage imageNamed:@"dessert-3.jpg"],
			 [UIImage imageNamed:@"dessert-4.jpg"],
			 [UIImage imageNamed:@"dessert-5.jpg"],
			 nil];
    
    
    //items = mainCourseArray; //[NSArray arrayWithArray:mainCourseArray];//[[NSArray alloc] initWithArray:mainCourseArray]; //
	
	// Initialize and configure the carousel
	//carousel = [[iCarousel alloc] initWithFrame:self.view.bounds];
	carousel = [[iCarousel alloc] initWithFrame:CGRectMake(310, 235, 280, 160)];
	
    //carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    carousel.type = iCarouselTypeRotary;
	carousel.dataSource = self;
	carousel.delegate = self;
    
    [self.view addSubview:carousel];
    
    
}


- (void)carousel: (iCarousel *)_carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"Did select item at index %d", index); // sample
    
    PDFViewController *aController = [[PDFViewController alloc]init];
    
    NSString *filename = [NSString stringWithFormat:@"main-%d", index + 1];
    [aController setFileName:filename];
    [self.navigationController pushViewController:aController animated:YES];
    [aController release];
}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [items count];
}

- (UIView *)carousel:(iCarousel *)_carousel viewForItemAtIndex:(NSUInteger)index
{
    UIImage *image = [items objectAtIndex:index];
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
