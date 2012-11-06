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
            productId = [NSString stringWithFormat:@"dishwasher-compact"];
            break;
        case 7:
            productId = [NSString stringWithFormat:@"dishwasher-compact"];
            break;
        case 8:
            productId = [NSString stringWithFormat:@"dishwasher-builtin"];
            break;
            
    }
    
    return productId;
}
- (void) changeProduct: (UITapGestureRecognizer *) sender {
    NSLog(@"changeProduct %d", sender.view.tag);
    
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
            background.image = [UIImage imageNamed:@"dishwasher-compact-main@2x.png"];
            main.text = @"Dishwashers";
            dishwasherOptions.hidden = NO;
            builtinOption.hidden = NO;
            compactOption.hidden = NO;
            currentProduct = 6;
            break;
        case 7:
            background.image = [UIImage imageNamed:@"dishwasher-compact-main@2x.png"];
            main.text = @"Dishwashers";
            currentProduct = 7;
            break;
        case 8:
            background.image = [UIImage imageNamed:@"dishwasher-builtin-main@2x.png"];
            main.text = @"Dishwashers";
            currentProduct = 8;
            break;
            
    }
    
    crGallerySS.hidden = YES;
    crGalleryBS.hidden = YES;
    crGallerySS50.hidden = YES;
    crGallerySS60.hidden = YES;
    crGallerySS90.hidden = YES;
    crGalleryBS50.hidden = YES;
    hoodsGallerySL.hidden =YES;
    hoodsGalleryC.hidden =YES;
    hoodsGallerySL60.hidden = YES;
    hoodsGallerySL90.hidden = YES;
    
}

- (void) crGalleryChange: (UITapGestureRecognizer *) sender {
    NSLog(@"crGalleryChange:%d", sender.view.tag);
    switch (sender.view.tag) {
        case 1: {
            crGallerySS.backgroundColor = UIColorFromRGB(0x828282);
            crGalleryBS.backgroundColor = UIColorFromRGB(0xC2C2C2);
            
            crGallerySS50.hidden = NO;
            crGallerySS60.hidden = NO;
            crGallerySS90.hidden = NO;
            crGalleryBS50.hidden = YES;
            break;
        }
        case 2: {
            crGallerySS.backgroundColor = UIColorFromRGB(0xC2C2C2);
            crGalleryBS.backgroundColor = UIColorFromRGB(0x828282);//828282
            
            crGallerySS50.hidden = YES;
            crGallerySS60.hidden = YES;
            crGallerySS90.hidden = YES;
            crGalleryBS50.hidden = NO;
            break;
        }
    }

}
- (void) crSpecsChange: (UITapGestureRecognizer *) sender {
    NSLog(@"%d", sender.view.tag);
    switch (sender.view.tag) {
        case 1: {
            NSString *imgName = [NSString stringWithFormat:@"free-standing-cookers-specs-ss@2x.png"];
            background.image = [UIImage imageNamed:imgName];
            
            break;
        }
        case 2: {
            NSString *imgName = [NSString stringWithFormat:@"free-standing-cookers-specs-bs@2x.png"];
            background.image = [UIImage imageNamed:imgName];
            
            
            break;
        }
    }
    
    crSpecsSS.hidden = YES;
    crSpecsBS.hidden = YES;
    
    
}

- (void) crGalleryLev2Change: (UITapGestureRecognizer *) sender {
    NSLog(@"crGalleryLev2Change:");
    
    switch (sender.view.tag) {
        case 1: {
            NSString *imgName = [NSString stringWithFormat:@"free-standing-cookers-gallery-ss-50@2x.png"];
            background.image = [UIImage imageNamed:imgName];
            
            
            break;
        }
        case 2: {
            NSString *imgName = [NSString stringWithFormat:@"free-standing-cookers-gallery-ss-60@2x.png"];
            background.image = [UIImage imageNamed:imgName];
            break;
        }
        case 3: {
            NSString *imgName = [NSString stringWithFormat:@"free-standing-cookers-gallery-ss-90@2x.png"];
            background.image = [UIImage imageNamed:imgName];
            break;
        }
        case 4: {
            NSString *imgName = [NSString stringWithFormat:@"free-standing-cookers-gallery-bs-50@2x.png"];
            background.image = [UIImage imageNamed:imgName];
            break;
        }
    }
    
    crGallerySS.hidden = YES;
    crGalleryBS.hidden = YES;
    crGallerySS50.hidden = YES;
    crGallerySS60.hidden = YES;
    crGallerySS90.hidden = YES;
    crGalleryBS50.hidden = YES;
    
}


- (void) hoodsGalleryChange: (UITapGestureRecognizer *) sender {
    NSLog(@"hoodsGalleryChange: %d", sender.view.tag);
    switch (sender.view.tag) {
        case 1: {
            hoodsGallerySL.backgroundColor = UIColorFromRGB(0x828282);
            hoodsGalleryC.backgroundColor = UIColorFromRGB(0xC2C2C2);
            
            hoodsGallerySL60.hidden = NO;
            hoodsGallerySL90.hidden = NO;
            
            /*crGallerySS50.hidden = NO;
            crGallerySS60.hidden = NO;
            crGallerySS90.hidden = NO;
            crGalleryBS50.hidden = YES;
            */
            break;
        }
        case 2: {
            NSString *imgName = [NSString stringWithFormat:@"hoods-gallery-c-90@2x.png"];
            background.image = [UIImage imageNamed:imgName];
            
            hoodsGallerySL.hidden =YES;
            hoodsGalleryC.hidden =YES;
            hoodsGallerySL60.hidden = YES;
            hoodsGallerySL90.hidden = YES;
            //crGallerySS.backgroundColor = UIColorFromRGB(0xC2C2C2);
            //crGalleryBS.backgroundColor = UIColorFromRGB(0x828282);//828282
            /*
            crGallerySS50.hidden = YES;
            crGallerySS60.hidden = YES;
            crGallerySS90.hidden = YES;
            crGalleryBS50.hidden = NO;
             */
            break;
        }
    }
    
}
- (void) hoodsGalleryLev2Change: (UITapGestureRecognizer *) sender {
    NSLog(@"hoodsGalleryLev2Change");
    switch (sender.view.tag) {
        case 1: {
            NSString *imgName = [NSString stringWithFormat:@"hoods-gallery-sl-60@2x.png"];
            background.image = [UIImage imageNamed:imgName];
            
            
            break;
        }
        case 2: {
            NSString *imgName = [NSString stringWithFormat:@"hoods-gallery-sl-90@2x.png"];
            background.image = [UIImage imageNamed:imgName];
            break;
        }
    }
    
    hoodsGallerySL.hidden =YES;
    hoodsGalleryC.hidden =YES;
    hoodsGallerySL60.hidden = YES;
    hoodsGallerySL90.hidden = YES;
    
}

- (void) hoodsSpecsChange: (UITapGestureRecognizer *) sender {
    NSLog(@"hoodsSpecsChange:%d", sender.view.tag);
    switch (sender.view.tag) {
        case 1: {
            hoodsSpecsSL.backgroundColor = UIColorFromRGB(0x828282);
            hoodsSpecsC.backgroundColor = UIColorFromRGB(0xC2C2C2);
            
            hoodsSpecsSL60.hidden = NO;
            hoodsSpecsSL90.hidden = NO;
            
            /*crGallerySS50.hidden = NO;
             crGallerySS60.hidden = NO;
             crGallerySS90.hidden = NO;
             crGalleryBS50.hidden = YES;
             */
            break;
        }
        case 2: {
            NSString *imgName = [NSString stringWithFormat:@"hoods-specs-c-90@2x.png"];
            background.image = [UIImage imageNamed:imgName];
            
            hoodsSpecsSL.hidden =YES;
            hoodsSpecsC.hidden =YES;
            hoodsSpecsSL60.hidden = YES;
            hoodsSpecsSL90.hidden = YES;
            //crGallerySS.backgroundColor = UIColorFromRGB(0xC2C2C2);
            //crGalleryBS.backgroundColor = UIColorFromRGB(0x828282);//828282
            /*
             crGallerySS50.hidden = YES;
             crGallerySS60.hidden = YES;
             crGallerySS90.hidden = YES;
             crGalleryBS50.hidden = NO;
             */
            break;
        }
    }
    
}

- (void) hoodsSpecsLev2Change: (UITapGestureRecognizer *) sender {
    NSLog(@"hoodsGalleryLev2Change");
    switch (sender.view.tag) {
        case 1: {
            NSString *imgName = [NSString stringWithFormat:@"hoods-specs-sl-60@2x.png"];
            background.image = [UIImage imageNamed:imgName];
            
            
            break;
        }
        case 2: {
            NSString *imgName = [NSString stringWithFormat:@"hoods-specs-sl-90@2x.png"];
            background.image = [UIImage imageNamed:imgName];
            break;
        }
    }
    
    hoodsSpecsSL.hidden =YES;
    hoodsSpecsC.hidden =YES;
    hoodsSpecsSL60.hidden = YES;
    hoodsSpecsSL90.hidden = YES;
    
}

- (void) changeInfo: (UITapGestureRecognizer *) sender {
    NSLog(@"changeInfo:%d", currentProduct);
    
    // background.image = [UIImage imageNamed:@"free-standing-cookers-main@2x"];
    
    
    NSString *imgName;
    switch (sender.view.tag) {
        case 1: {
            main.backgroundColor = [UIColor blackColor];
            gallery.backgroundColor = UIColorFromRGB(0xa11a20);
            specs.backgroundColor = UIColorFromRGB(0xa11a20);
            imgName = [NSString stringWithFormat:@"%@-main@2x.png",[self getProductId:currentProduct]];
            
            if (currentProduct == 1) {
                crGallerySS.hidden = YES;
                crGalleryBS.hidden = YES;
                crSpecsSS.hidden = YES;
                crSpecsBS.hidden = YES;
            } else if (currentProduct == 4) {
                hoodsGallerySL.hidden = YES;
                hoodsGalleryC.hidden = YES;
                hoodsSpecsSL.hidden = YES;
                hoodsSpecsC.hidden = YES;
            } /*else if (currentProduct == 7) {
                imgName = [NSString stringWithFormat:@"dishwasher-compact-main@2x.png"];
            } else if (currentProduct == 8) {
                imgName = [NSString stringWithFormat:@"dishwasher-builtin-main@2x.png"];
            } */
            
            background.image = [UIImage imageNamed:imgName];
            
            break;

        }
        case 2:{
            main.backgroundColor = UIColorFromRGB(0xa11a20);
            gallery.backgroundColor = [UIColor blackColor];
            specs.backgroundColor = UIColorFromRGB(0xa11a20);
            imgName = [NSString stringWithFormat:@"%@-gallery@2x.png",[self getProductId:currentProduct]];
            
            if (currentProduct == 1) {
                imgName = [NSString stringWithFormat:@"free-standing-cookers-gallery-ss-50@2x.png"];
                crGallerySS.hidden = NO;
                crGalleryBS.hidden = NO;
                crSpecsSS.hidden = YES;
                crSpecsBS.hidden = YES;
                hoodsGallerySL.hidden = YES;
                hoodsGalleryC.hidden = YES;
            } else if (currentProduct == 4) {
                imgName = [NSString stringWithFormat:@"hoods-gallery-sl-60@2x.png"];
                hoodsGallerySL.hidden = NO;
                hoodsGalleryC.hidden = NO;
                hoodsSpecsSL.hidden = YES;
                hoodsSpecsC.hidden = YES;
                
            } /*else if (currentProduct == 7) {
                imgName = [NSString stringWithFormat:@"dishwasher-compact-gallery@2x.png"];
            } else if (currentProduct == 8) {
                imgName = [NSString stringWithFormat:@"dishwasher-builtin-gallery@2x.png"];
            }
            */
            background.image = [UIImage imageNamed:imgName];
            
            
            
            break;
        }
        case 3:{
            main.backgroundColor = UIColorFromRGB(0xa11a20);
            gallery.backgroundColor = UIColorFromRGB(0xa11a20);
            specs.backgroundColor = [UIColor blackColor];
            imgName = [NSString stringWithFormat:@"%@-specs@2x.png",[self getProductId:currentProduct]];
            
            
            if (currentProduct == 1) {
                imgName = [NSString stringWithFormat:@"free-standing-cookers-specs-ss@2x.png"];
                crGallerySS.hidden = YES;
                crGalleryBS.hidden = YES;
                crSpecsSS.hidden = NO;
                crSpecsBS.hidden = NO;
                hoodsGallerySL.hidden = YES;
                hoodsGalleryC.hidden = YES;
            } else if (currentProduct == 4) {
                imgName = [NSString stringWithFormat:@"hoods-specs-sl-60@2x.png"];
                hoodsGallerySL.hidden = YES;
                hoodsGalleryC.hidden = YES;
                hoodsSpecsSL.hidden = NO;
                hoodsSpecsC.hidden = NO;
                
                
            } /*else if (currentProduct == 7) {
                NSLog(@"the error is here changeinfo7");// imgName = [NSString stringWithFormat:@"dishwasher-compact-specs@2x.png"];
            } else if (currentProduct == 8) {
                NSLog(@"the error is here changeinfo8");//imgName = [NSString stringWithFormat:@"dishwasher-builtin-specs@2x.png"];
            }*/
            background.image = [UIImage imageNamed:imgName];
            break;
        }
        
            
    }
   
}


- (void) dishwasherOptionsChange: (UITapGestureRecognizer *) sender {
    NSLog(@"dishwasherOptionsChange: %d",sender.view.tag);
    switch (sender.view.tag) {
        case 1:
        {
            dishwasherOptions.image = [UIImage imageNamed:@"dishwasher-button-compact.png"];
            background.image = [UIImage imageNamed:@"dishwasher-compact-main@2x.png"];
            main.text = @"Compact Dishwasher";
            currentProduct = 7;
            break;
        }
        case 2:
        {
            dishwasherOptions.image = [UIImage imageNamed:@"dishwasher-button-builtin.png"];
            background.image = [UIImage imageNamed:@"dishwasher-builtin-main@2x.png"];
            main.text = @"Built In Dishwasher";
            currentProduct = 8;
            break;
        }
    }
    
    dishwasherOptions.hidden = YES;
    builtinOption.hidden = YES;
    compactOption.hidden = YES;
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
    main.text = @"Cooking Ranges";
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
    /**
        COOKING RANGES GALLERY
     **/
    crGallerySS = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200, 91 +40, 200, 40)];
    crGallerySS.text = @"Stainless Steel";
    crGallerySS.tag = 1;
    [crGallerySS setTextAlignment:UITextAlignmentCenter];
    crGallerySS.textColor = [UIColor whiteColor];
    crGallerySS.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:crGallerySS];
    UITapGestureRecognizer *crGallerySSTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(crGalleryChange: ) ];
    [crGallerySS addGestureRecognizer:crGallerySSTap];
    [crGallerySS setUserInteractionEnabled:YES];
    [crGallerySSTap release];
    crGallerySS.hidden = YES;
    
    crGalleryBS = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200, 91 +40 + 40, 200, 40)];
    crGalleryBS.text = @"Black Series";
    crGalleryBS.tag = 2;
    [crGalleryBS setTextAlignment:UITextAlignmentCenter];
    crGalleryBS.textColor = [UIColor whiteColor];
    crGalleryBS.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:crGalleryBS];
    UITapGestureRecognizer *crGalleryBSTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(crGalleryChange: ) ];
    [crGalleryBS addGestureRecognizer:crGalleryBSTap];
    [crGalleryBS setUserInteractionEnabled:YES];
    [crGalleryBSTap release];
    crGalleryBS.hidden = YES;
    
    crGallerySS50 = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200, 91 +40, 200, 40)];
    crGallerySS50.text = @"50 cm";
    crGallerySS50.tag = 1;
    [crGallerySS50 setTextAlignment:UITextAlignmentCenter];
    crGallerySS50.textColor = [UIColor whiteColor];
    crGallerySS50.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:crGallerySS50];
    UITapGestureRecognizer *crGallerySS50Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(crGalleryLev2Change: ) ];
    [crGallerySS50 addGestureRecognizer:crGallerySS50Tap];
    [crGallerySS50 setUserInteractionEnabled:YES];
    [crGallerySS50Tap release];
    crGallerySS50.hidden = YES;
    
    crGallerySS60 = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200, 91 +40 + 40, 200, 40)];
    crGallerySS60.text = @"60 cm";
    crGallerySS60.tag = 2;
    [crGallerySS60 setTextAlignment:UITextAlignmentCenter];
    crGallerySS60.textColor = [UIColor whiteColor];
    crGallerySS60.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:crGallerySS60];
    UITapGestureRecognizer *crGallerySS60Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(crGalleryLev2Change: ) ];
    [crGallerySS60 addGestureRecognizer:crGallerySS60Tap];
    [crGallerySS60 setUserInteractionEnabled:YES];
    [crGallerySS60Tap release];
    crGallerySS60.hidden = YES;
    
    crGallerySS90 = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200, 91 +40 + 40 +40, 200, 40)];
    crGallerySS90.text = @"90 cm";
    [crGallerySS90 setTextAlignment:UITextAlignmentCenter];
    crGallerySS90.textColor = [UIColor whiteColor];
    crGallerySS90.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:crGallerySS90];
    crGallerySS90.tag = 3;
    UITapGestureRecognizer *crGallerySS90Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(crGalleryLev2Change: ) ];
    [crGallerySS90 addGestureRecognizer:crGallerySS90Tap];
    [crGallerySS90 setUserInteractionEnabled:YES];
    [crGallerySS90Tap release];
    crGallerySS90.hidden = YES;
    
    crGalleryBS50 = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200, 91 +40 +40, 200, 40)];
    crGalleryBS50.text = @"50 cm";
    [crGalleryBS50 setTextAlignment:UITextAlignmentCenter];
    crGalleryBS50.textColor = [UIColor whiteColor];
    crGalleryBS50.backgroundColor = UIColorFromRGB(0xC2C2C2);//828282
    [self.view addSubview:crGalleryBS50];
    crGalleryBS50.hidden = YES;
    crGalleryBS50.tag = 4;
    UITapGestureRecognizer *crGalleryBS50Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(crGalleryLev2Change: ) ];
    [crGalleryBS50 addGestureRecognizer:crGalleryBS50Tap];
    [crGalleryBS50 setUserInteractionEnabled:YES];
    [crGalleryBS50Tap release];
    
    
    crSpecsSS = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200, 91 + 40, 250, 40)];
    crSpecsSS.text = @"Stainless Steel";
    crSpecsSS.textColor = [UIColor whiteColor];
    crSpecsSS.backgroundColor = UIColorFromRGB(0xC2C2C2);
    crSpecsSS.tag = 1;
    [crSpecsSS setTextAlignment:UITextAlignmentCenter];
    [self.view addSubview:crSpecsSS];
    crSpecsSS.hidden = YES;
    UITapGestureRecognizer *crSpecsSSTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(crSpecsChange: ) ];
    [crSpecsSS addGestureRecognizer:crSpecsSSTap];
    [crSpecsSS setUserInteractionEnabled:YES];
    [crSpecsSSTap release];
    
    crSpecsBS = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200, 91 + 40 + 40, 250, 40)];
    crSpecsBS.text = @"Black Series";
    crSpecsBS.textColor = [UIColor whiteColor];
    crSpecsBS.backgroundColor = UIColorFromRGB(0xC2C2C2);
    crSpecsBS.tag = 2;
    [crSpecsBS setTextAlignment:UITextAlignmentCenter];
    [self.view addSubview:crSpecsBS];
    crSpecsBS.hidden = YES;
    UITapGestureRecognizer *crSpecsBSTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(crSpecsChange: ) ];
    [crSpecsBS addGestureRecognizer:crSpecsBSTap];
    [crSpecsBS setUserInteractionEnabled:YES];
    [crSpecsBSTap release];
    
    /**
     HOODS GALLERY
     **/
    hoodsGallerySL = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200, 91 +40, 200, 40)];
    hoodsGallerySL.text = @"Slim Line";
    hoodsGallerySL.tag = 1;
    [hoodsGallerySL setTextAlignment:UITextAlignmentCenter];
    hoodsGallerySL.textColor = [UIColor whiteColor];
    hoodsGallerySL.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:hoodsGallerySL];
    UITapGestureRecognizer *hoodsGallerySLTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hoodsGalleryChange: ) ];
    [hoodsGallerySL addGestureRecognizer:hoodsGallerySLTap];
    [hoodsGallerySL setUserInteractionEnabled:YES];
    [hoodsGallerySLTap release];
    hoodsGallerySL.hidden = YES;
    
    hoodsGalleryC = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200, 91 +40 + 40, 200, 40)];
    hoodsGalleryC.text = @"Chimney";
    hoodsGalleryC.tag = 2;
    [hoodsGalleryC setTextAlignment:UITextAlignmentCenter];
    hoodsGalleryC.textColor = [UIColor whiteColor];
    hoodsGalleryC.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:hoodsGalleryC];
    UITapGestureRecognizer *hoodsGalleryCTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hoodsGalleryChange: ) ];
    [hoodsGalleryC addGestureRecognizer:hoodsGalleryCTap];
    [hoodsGalleryC setUserInteractionEnabled:YES];
    [hoodsGalleryCTap release];
    hoodsGalleryC.hidden = YES;
    
    hoodsGallerySL60 = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200, 91 +40, 200, 40)];
    hoodsGallerySL60.text = @"60 cm";
    hoodsGallerySL60.tag = 1;
    [hoodsGallerySL60 setTextAlignment:UITextAlignmentCenter];
    hoodsGallerySL60.textColor = [UIColor whiteColor];
    hoodsGallerySL60.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:hoodsGallerySL60];
    UITapGestureRecognizer *hoodsGallerySL60Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hoodsGalleryLev2Change: ) ];
    [hoodsGallerySL60 addGestureRecognizer:hoodsGallerySL60Tap];
    [hoodsGallerySL60 setUserInteractionEnabled:YES];
    [hoodsGallerySL60Tap release];
    hoodsGallerySL60.hidden = YES;
    
    hoodsGallerySL90 = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200, 91 +40 + 40, 200, 40)];
    hoodsGallerySL90.text = @"90 cm";
    hoodsGallerySL90.tag = 2;
    [hoodsGallerySL90 setTextAlignment:UITextAlignmentCenter];
    hoodsGallerySL90.textColor = [UIColor whiteColor];
    hoodsGallerySL90.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:hoodsGallerySL90];
    UITapGestureRecognizer *hoodsGallerySL90Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hoodsGalleryLev2Change: ) ];
    [hoodsGallerySL90 addGestureRecognizer:hoodsGallerySL90Tap];
    [hoodsGallerySL90 setUserInteractionEnabled:YES];
    [hoodsGallerySL90Tap release];
    hoodsGallerySL90.hidden = YES;
    
    /****/
    hoodsSpecsSL = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200, 91 + 40, 250, 40)];
    hoodsSpecsSL.text = @"Slim Line";
    hoodsSpecsSL.tag = 1;
    [hoodsSpecsSL setTextAlignment:UITextAlignmentCenter];
    hoodsSpecsSL.textColor = [UIColor whiteColor];
    hoodsSpecsSL.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:hoodsSpecsSL];
    UITapGestureRecognizer *hoodsSpecsSLTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hoodsSpecsChange: ) ];
    [hoodsSpecsSL addGestureRecognizer:hoodsSpecsSLTap];
    [hoodsSpecsSL setUserInteractionEnabled:YES];
    [hoodsSpecsSLTap release];
    hoodsSpecsSL.hidden = YES;
    
    hoodsSpecsC = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200, 91 + 40 + 40, 250, 40)];
    hoodsSpecsC.text = @"Chimney";
    hoodsSpecsC.tag = 2;
    [hoodsSpecsC setTextAlignment:UITextAlignmentCenter];
    hoodsSpecsC.textColor = [UIColor whiteColor];
    hoodsSpecsC.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:hoodsSpecsC];
    UITapGestureRecognizer *hoodsSpecsCTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hoodsSpecsChange: ) ];
    [hoodsSpecsC addGestureRecognizer:hoodsSpecsCTap];
    [hoodsSpecsC setUserInteractionEnabled:YES];
    [hoodsSpecsCTap release];
    hoodsSpecsC.hidden = YES;
    
    hoodsSpecsSL60 = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200+ 250, 91 +40, 250, 40)];
    hoodsSpecsSL60.text = @"60 cm";
    hoodsSpecsSL60.tag = 1;
    [hoodsSpecsSL60 setTextAlignment:UITextAlignmentCenter];
    hoodsSpecsSL60.textColor = [UIColor whiteColor];
    hoodsSpecsSL60.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:hoodsSpecsSL60];
    UITapGestureRecognizer *hoodsSpecsSL60Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hoodsSpecsLev2Change: ) ];
    [hoodsSpecsSL60 addGestureRecognizer:hoodsSpecsSL60Tap];
    [hoodsSpecsSL60 setUserInteractionEnabled:YES];
    [hoodsSpecsSL60Tap release];
    hoodsSpecsSL60.hidden = YES;
    
    hoodsSpecsSL90 = [[UILabel alloc]initWithFrame:CGRectMake(10 + 200 + 200 + 250, 91 +40 + 40, 250, 40)];
    hoodsSpecsSL90.text = @"90 cm";
    hoodsSpecsSL90.tag = 2;
    [hoodsSpecsSL90 setTextAlignment:UITextAlignmentCenter];
    hoodsSpecsSL90.textColor = [UIColor whiteColor];
    hoodsSpecsSL90.backgroundColor = UIColorFromRGB(0xC2C2C2);
    [self.view addSubview:hoodsSpecsSL90];
    UITapGestureRecognizer *hoodsSpecsSL90Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hoodsSpecsLev2Change: ) ];
    [hoodsSpecsSL90 addGestureRecognizer:hoodsSpecsSL90Tap];
    [hoodsSpecsSL90 setUserInteractionEnabled:YES];
    [hoodsSpecsSL90Tap release];
    hoodsSpecsSL90.hidden = YES;
    
    UIImage *dishwasherButton = [UIImage imageNamed:@"dishwasher-button-compact.png"];
    dishwasherOptions = [[UIImageView alloc]initWithImage:dishwasherButton];
    dishwasherOptions.frame = CGRectMake(900, 38, dishwasherButton.size.width/2, dishwasherButton.size.height/2);
    [self.view addSubview:dishwasherOptions];
    dishwasherOptions.hidden = YES;
    
    compactOption = [[UIImageView alloc]initWithFrame:CGRectMake(900, 40, dishwasherButton.size.width/2, 35)];
    compactOption.tag = 1;
    [self.view addSubview:compactOption];
    compactOption.hidden = YES;
    UITapGestureRecognizer *compactOptionTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dishwasherOptionsChange: ) ];
    [compactOption addGestureRecognizer:compactOptionTap];
    [compactOption setUserInteractionEnabled:YES];
    [compactOptionTap release];
    
    builtinOption = [[UIImageView alloc]initWithFrame:CGRectMake(900, 75, dishwasherButton.size.width/2, 35)];
    builtinOption.tag = 2;
    [self.view addSubview:builtinOption];
    builtinOption.hidden = YES;
    UITapGestureRecognizer *builtinOptionTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dishwasherOptionsChange: ) ];
    [builtinOption addGestureRecognizer:builtinOptionTap];
    [builtinOption setUserInteractionEnabled:YES];
    [builtinOptionTap release];
    
    
    
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
