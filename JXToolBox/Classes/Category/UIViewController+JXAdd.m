//
//  UIViewController+JXAdd.m
//  JXToolBox
//
//  Created by xinjin on 2021/3/22.
//

#import "UIViewController+JXAdd.h"

@implementation UIViewController (JXAdd)

+ (UIViewController *)currentViewController {
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self findBestViewController:viewController];
}

+ (UIViewController *)findBestViewController:(UIViewController *)vc {
    if (vc.presentedViewController) {
        
        // Return presented view controller
        return [UIViewController findBestViewController:vc];
        
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        
        // Return right hand side
        UISplitViewController *svc = (UISplitViewController *)vc;
        if (svc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:svc.viewControllers.lastObject];
        } else {
            return vc;
        }
        
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        
        // Return top view
        UINavigationController *nav = (UINavigationController *)vc;
        if (nav.viewControllers.count > 0) {
            return [UIViewController findBestViewController:nav.topViewController];
        } else {
            return nav;
        }
        
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        
        // Return visible view
        UITabBarController *tabBarController = (UITabBarController *)vc;
        if (tabBarController.viewControllers.count > 0) {
            return [UIViewController findBestViewController:tabBarController.selectedViewController];
        } else {
            return tabBarController;
        }
        
    } else {
        
        // Unknown view controller type, return last child view controller
        return vc;
        
    }
}

@end
