#import "AppDelegate.h"
#import "DetailViewController.h"

// クラス拡張: 実装ファイル内でInterface部を宣言してクラスを拡張すること
// 無名カテゴリとは異なりPrivateなメソッドやインスタンス変数を宣言できる
@interface AppDelegate () <UISplitViewControllerDelegate>

@end


@implementation AppDelegate

// アプリケーションの起動後
// application willFinishLaunchingWithOptions: UI stateの再保持前
// application didFinishLaunchingWithOptions:  UI stateの再保持後
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    splitViewController.delegate = self;
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}


#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
        return YES;
    } else {
        return NO;
    }
}

@end