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
@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    RootViewController *viewController;
    UINavigationController *navController;
    PhotoAppController *photoAppController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) RootViewController *viewController;
@property (nonatomic, retain) UINavigationController *navController;
@property (nonatomic, retain) PhotoAppController *photoAppController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
