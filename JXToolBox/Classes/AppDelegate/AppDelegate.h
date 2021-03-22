//
//  AppDelegate.h
//  JXToolBox
//
//  Created by xinjin on 2021/3/22.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;

@property (strong, nonatomic) UIWindow *window;

@end

