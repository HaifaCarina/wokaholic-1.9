//
//  TestViewController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 11/5/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "TestViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface TestViewController ()

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *) getProductId: (NSInteger) tag {
    NSString *productId;
    switch (tag) {
        case 1:
            productId = [NSString stringWithFormat:@"free-standing-cookers"];
            break;
        case 2:
            productId = [NSString stringWithFormat:@"built-in-ovens"];
            break;
        case 3:
            productId = [NSString stringWithFormat:@"hobs"];
            break;
        case 4:
            productId = [NSString stringWithFormat:@"hoods"];
            break;
        case 5:
            productId = [NSString stringWithFormat:@"microwave-ovens"];
            break;
        case 6:
            productId = [NSString stringWithFormat:@"dishwasher-builtin"];
            break;
            
    }
    
    return productId;
}
- (void) changeProduct: (UITapGestureRecognizer *) sender {
    NSLog(@"%d", sender.view.tag);
    
   // background.image = [UIImage imageNamed:@"free-standing-cookers-main@2x"];
    main.backgroundColor = [UIColor blackColor];
    gallery.backgroundColor = UIColorFromRGB(0xa11a20);
    specs.backgroundColor = UIColorFromRGB(0xa11a20);
    switch (sender.view.tag) {
        case 1:
            background.image = [UIImage imageNamed:@"free-standing-cookers-main@2x.png"];
            main.text = @"Cooking Ranges";
            currentProduct = 1;
            break;
        case 2:
            background.image = [UIImage imageNamed:@"built-in-ovens-main@2x.png"];
            main.text = @"Built-in Ovens";
            currentProduct = 2;
            break;
        case 3:
            background.image = [UIImage imageNamed:@"hobs-main@2x.png"];
            main.text = @"Hobs";
            currentProduct = 3;
            break;
        case 4:
            background.image = [UIImage imageNamed:@"hoods-main@2x.png"];
            main.text = @"Hoods";
            currentProduct = 4;
            break;
        case 5:
            background.image = [UIImage imageNamed:@"microwave-ovens-main@2x.png"];
            main.text = @"Microwave Ovens";
            currentProduct = 5;
            break;
        case 6:
            background.image = [UIImage imageNamed:@"dishwasher-builtin-main@2x.png"];
            main.text = @"Dishwashers";
            currentProduct = 6;
            break;
            
    }
    
}

- (void) changeInfo: (UITapGestureRecognizer *) sender {
    NSLog(@"%d", currentProduct);
    
    // background.image = [UIImage imageNamed:@"free-standing-cookers-main@2x"];
    
    NSString *imgName;
    switch (sender.view.tag) {
        case 1: {
            main.backgroundColor = [UIColor blackColor];
            gallery.backgroundColor = UIColorFromRGB(0xa11a20);
            specs.backgroundColor = UIColorFromRGB(0xa11a20);
            imgName = [NSString stringWithFormat:@"%@-main@2x.png",[self getProductId:currentProduct]];
            background.image = [UIImage imageNamed:imgName];
            
            break;

        }
        case 2:{
            main.backgroundColor = UIColorFromRGB(0xa11a20);
            gallery.backgroundColor = [UIColor blackColor];
            specs.backgroundColor = UIColorFromRGB(0xa11a20);
            imgName = [NSString stringWithFormat:@"%@-gallery@2x.png",[self getProductId:currentProduct]];
            background.image = [UIImage imageNamed:imgName];
            
            break;
        }
        case 3:{
            main.backgroundColor = UIColorFromRGB(0xa11a20);
            gallery.backgroundColor = UIColorFromRGB(0xa11a20);
            specs.backgroundColor = [UIColor blackColor];
            imgName = [NSString stringWithFormat:@"%@-specs@2x.png",[self getProductId:currentProduct]];
            background.image = [UIImage imageNamed:imgName];
            
            break;
        }
        
            
    }
   
}
- (void) tappedHome {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	/*
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width)];
	webView.scrollView.bounces = NO;
    webView.scalesPageToFit = YES;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"www"]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    //add the web view to the content view
	[self.view addSubview:webView];
    [webView release];
    */
    
    background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    background.image = [UIImage imageNamed:@"free-standing-cookers-main@2x.png"];
    background.backgroundColor = [UIColor clearColor];
    [self.view addSubview:background];
    
    // COOKING RANGES
    UIImageView *cookingRanges = [[UIImageView alloc] initWithFrame:CGRectMake(340, 11, 140, 30)];
    cookingRanges.backgroundColor = [UIColor clearColor];
    cookingRanges.tag = 1;
    [self.view addSubview:cookingRanges];
    UITapGestureRecognizer *cookingRangesTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeProduct: ) ];
    [cookingRanges addGestureRecognizer:cookingRangesTap];
    [cookingRanges setUserInteractionEnabled:YES];
    [cookingRangesTap release];
    
    // Builtin Ovens
    UIImageView *builtInOvens = [[UIImageView alloc] initWithFrame:CGRectMake(340 + 140, 11, 140, 30)];
    builtInOvens.backgroundColor = [UIColor clearColor];
    builtInOvens.tag = 2;
    [self.view addSubview:builtInOvens];
    UITapGestureRecognizer *builtInOvensTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeProduct: ) ];
    [builtInOvens addGestureRecognizer:builtInOvensTap];
    [builtInOvens setUserInteractionEnabled:YES];
    [builtInOvensTap release];
    
    // hobs
    UIImageView *hobs = [[UIImageView alloc] initWithFrame:CGRectMake(340 + 140 + 140, 11, 70, 30)];
    hobs.backgroundColor = [UIColor clearColor];
    hobs.tag = 3;
    [self.view addSubview:hobs];
    UITapGestureRecognizer *hobsTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeProduct: ) ];
    [hobs addGestureRecognizer:hobsTap];
    [hobs setUserInteractionEnabled:YES];
    [hobsTap release];
    
    // Hoods
    UIImageView *hoods = [[UIImageView alloc] initWithFrame:CGRectMake(340 + 140 + 140 + 70, 11, 70, 30)];
    hoods.backgroundColor = [UIColor clearColor];
    hoods.tag = 4;
    [self.view addSubview:hoods];
    UITapGestureRecognizer *hoodsTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeProduct: ) ];
    [hoods addGestureRecognizer:hoodsTap];
    [hoods setUserInteractionEnabled:YES];
    [hoodsTap release];
    
    // microwaveOvens
    UIImageView *microwaveOvens = [[UIImageView alloc] initWithFrame:CGRectMake(340 + 140 + 140 +70 +80, 11, 140, 30)];
    microwaveOvens.backgroundColor = [UIColor clearColor];
    microwaveOvens.tag = 5;
    [self.view addSubview:microwaveOvens];
    UITapGestureRecognizer *microwaveOvensTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeProduct: ) ];
    [microwaveOvens addGestureRecognizer:microwaveOvensTap];
    [microwaveOvens setUserInteractionEnabled:YES];
    [microwaveOvensTap release];
    
    // dishwashers
    UIImageView *dishwashers = [[UIImageView alloc] initWithFrame:CGRectMake(340 + 140 + 140 +70 + 80 + 140, 11, 100, 30)];
    dishwashers.backgroundColor = [UIColor clearColor];
    dishwashers.tag = 6;
    [self.view addSubview:dishwashers];
    UITapGestureRecognizer *dishwashersTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeProduct: ) ];
    [dishwashers addGestureRecognizer:dishwashersTap];
    [dishwashers setUserInteractionEnabled:YES];
    [dishwashersTap release];
    
    main = [[UILabel alloc]initWithFrame:CGRectMake(10, 91, 200, 40)];
    main.text = @"Microwave Ovens";
    main.textColor = [UIColor whiteColor];
    main.backgroundColor = [UIColor blackColor];
    main.tag = 1;
    [main setTextAlignment:UITextAlignmentCenter];
    [self.view addSubview:main];
    UITapGestureRecognizer *mainTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeInfo: ) ];
    [main addGestureRecognizer:mainTap];
    [main setUserInteractionEnabled:YES];
    [mainTap release];
    
    gallery = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200, 91, 200, 40)];
    gallery.text = @"Gallery";
    gallery.textColor = [UIColor whiteColor];
    gallery.backgroundColor = UIColorFromRGB(0xa11a20);
    gallery.tag = 2;
    [gallery setTextAlignment:UITextAlignmentCenter];
    [self.view addSubview:gallery];
    UITapGestureRecognizer *galleryTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeInfo: ) ];
    [gallery addGestureRecognizer:galleryTap];
    [gallery setUserInteractionEnabled:YES];
    [galleryTap release];
    
    specs = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200, 91, 250, 40)];
    specs.text = @"Product Specification";
    specs.textColor = [UIColor whiteColor];
    specs.backgroundColor = UIColorFromRGB(0xa11a20);
    specs.tag = 3;
    [specs setTextAlignment:UITextAlignmentCenter];
    [self.view addSubview:specs];
    UITapGestureRecognizer *specsTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeInfo: ) ];
    [specs addGestureRecognizer:specsTap];
    [specs setUserInteractionEnabled:YES];
    [specsTap release];
    
    // HOME BUTTON
    UIImageView *home = [[UIImageView alloc] initWithFrame:CGRectMake(10, 700, 60, 54)];
    home.image = [UIImage imageNamed:@"home-button.png"];
    home.backgroundColor = [UIColor clearColor];
    [self.view addSubview:home];
    UITapGestureRecognizer *homeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedHome ) ];
    [home addGestureRecognizer:homeTap];
    [home setUserInteractionEnabled:YES];
    [homeTap release];
    
    currentProduct = 1;

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
