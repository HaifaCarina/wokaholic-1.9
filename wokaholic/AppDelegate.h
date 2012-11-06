//
//  AppDelegate.h
//  wokaholic
//
//  Created by Haifa Carina Baluyos on 10/23/12.
//  Copyright (c) 2012 NMG Resources, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "PhotoAppController.h"
#import "FBConnect.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, FBSessionDelegate,FBDialogDelegate, FBRequestDelegate> {
    RootViewController *viewController;
    UINavigationController *navController;
    PhotoAppController *photoAppController;
    Facebook *facebook;
    NSMutableDictionary *params;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) RootViewController *viewController;
@property (nonatomic, retain) UINavigationController *navController;
@property (nonatomic, retain) PhotoAppController *photoAppController;
@property (nonatomic, retain) Facebook *facebook;
@property (nonatomic, retain) NSMutableDictionary *params;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void) facebookSetParameters: (NSMutableDictionary *) parameters;
- (void) postParameters;
@end
