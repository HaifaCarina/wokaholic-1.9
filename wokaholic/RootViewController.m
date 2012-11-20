//
//  RootViewController.m
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import "RootViewController.h"
@implementation RootViewController

- (void) tappedPhotoApp {
    NSLog(@"tap menu photoapp");
    PhotoAppController *aController = [[PhotoAppController alloc]init];
    [self.navigationController pushViewController:aController animated:YES];
}
- (void) tappedCookingQuiz{
    NSLog(@"tap menu CookingQuiz");
    CookingQuizController *aController = [[CookingQuizController alloc] init];
    [self.navigationController pushViewController:aController animated:YES];
    
}
- (void) tappedRecipes {
    NSLog(@"tap menu Recipes");
    RecipesController *aController = [[RecipesController alloc] init];
    [self.navigationController pushViewController:aController animated:YES];
}
- (void) tappedProductGuide {
    NSLog(@"tap menu ProductGuide");
    ProductGuideController *aController = [[ProductGuideController alloc] init];
    [self.navigationController pushViewController:aController animated:YES];
}

- (void) tappedAbout {
    AboutController *aController = [[AboutController alloc] init];
    [self.navigationController pushViewController:aController animated:YES];
}

- (void) loadView {
    [super loadView];

    UIImage *facebookButton = [UIImage imageNamed:@"facebook.png"];
    UIButton *playButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    playButton.frame = CGRectMake(110.0, 360.0, facebookButton.size.width, facebookButton.size.height);
    playButton.backgroundColor = [UIColor clearColor];
    [playButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    [playButton setBackgroundImage:facebookButton forState:UIControlStateNormal];
    //[self.view addSubview:playButton];
    
    UIImageView *homeBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home.png"]];
    homeBackground.frame = CGRectMake(0, 0, 1024, 768);
    [self.view addSubview:homeBackground];
    
    // PHOTO APP BUTTON
    UIImageView *photoApp = [[UIImageView alloc] initWithFrame:CGRectMake(825.0, 130.0, 188, 126)];
    photoApp.backgroundColor = [UIColor clearColor];
    [self.view addSubview:photoApp];
    UITapGestureRecognizer *photoAppTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedPhotoApp ) ];
    [photoApp addGestureRecognizer:photoAppTap];
    [photoApp setUserInteractionEnabled:YES];
    [photoAppTap release];
    
    // COOKING QUIZ BUTTON
    UIImageView *cookingQuiz = [[UIImageView alloc] initWithFrame:CGRectMake(825.0, 130.0 + 126, 188, 126)];
    cookingQuiz.backgroundColor = [UIColor clearColor];
    [self.view addSubview:cookingQuiz];
    UITapGestureRecognizer *cookingQuizTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCookingQuiz ) ];
    [cookingQuiz addGestureRecognizer:cookingQuizTap];
    [cookingQuiz setUserInteractionEnabled:YES];
    [cookingQuizTap release];
    
    // RECIPES BUTTON
    UIImageView *recipes = [[UIImageView alloc] initWithFrame:CGRectMake(825.0, 130.0 + 126 + 126, 188, 126)];
    recipes.backgroundColor = [UIColor clearColor];
    [self.view addSubview:recipes];
    UITapGestureRecognizer *recipesTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedRecipes ) ];
    [recipes addGestureRecognizer:recipesTap];
    [recipes setUserInteractionEnabled:YES];
    [recipesTap release];
    
    // PRODUCT GUIDE BUTTON
    UIImageView *productGuide = [[UIImageView alloc] initWithFrame:CGRectMake(825.0, 130.0 + 126 + 126 + 126, 188, 126)];
    productGuide.backgroundColor = [UIColor clearColor];
    [self.view addSubview:productGuide];
    UITapGestureRecognizer *productGuideTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedProductGuide ) ];
    [productGuide addGestureRecognizer:productGuideTap];
    [productGuide setUserInteractionEnabled:YES];
    [productGuideTap release];
    
    // ABOUT BUTTON
    UIImageView *about = [[UIImageView alloc] initWithFrame:CGRectMake(825.0, 130.0 + 126 + 126 + 126 + 126, 188, 80)];
    about.backgroundColor = [UIColor clearColor];
    [self.view addSubview:about];
    UITapGestureRecognizer *aboutTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedAbout ) ];
    [about addGestureRecognizer:aboutTap];
    [about setUserInteractionEnabled:YES];
    [aboutTap release];

    
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight);
}
@end
