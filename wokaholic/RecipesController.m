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
@end

@implementation RecipesController
@synthesize items;
- (void) tappedHome {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) loadView {
    [super loadView];
    
    self.navigationController.navigationBar.hidden = YES;
    //[[UIDevice currentDevice] setOrientation:UIInterfaceOrientationLandscapeLeft];
    
    UIImageView *background = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"recipes-bg.png"]];
    background.backgroundColor = [UIColor clearColor];
    [self.view addSubview:background];
    
    // HOME BUTTON
    UIImageView *home = [[UIImageView alloc] initWithFrame:CGRectMake(950, 700, 60, 54)];
    home.image = [UIImage imageNamed:@"home-button.png"];
    home.backgroundColor = [UIColor clearColor];
    [self.view addSubview:home];
    UITapGestureRecognizer *homeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedHome ) ];
    [home addGestureRecognizer:homeTap];
    [home setUserInteractionEnabled:YES];
    [homeTap release];
    
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
	
	// Initialize and configure the carousel
	//carousel = [[iCarousel alloc] initWithFrame:self.view.bounds];
	carousel = [[iCarousel alloc] initWithFrame:CGRectMake(300, 200, 300, 200)];
	
    //carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    carousel.type = iCarouselTypeRotary;
	carousel.dataSource = self;
	carousel.delegate = self;
    //carousel.backgroundColor = [UIColor blueColor];
	[self.view addSubview:carousel];
}


- (void)carousel: (iCarousel *)_carousel didSelectItemAtIndex:(NSInteger)index
{
    
    NSLog(@"Did select item at index %d", index); // sample
    
    PDFViewController *aController = [[PDFViewController alloc]init];
    
    NSString *filename = [NSString stringWithFormat:@"main-%d.pdf", index + 1];
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

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
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
