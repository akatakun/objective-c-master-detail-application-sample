#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

// プロパティ
// @property (${option_array}) ${class} ${property}
// アクセス:   readonly or readwrite
// 所有:       assign or weak or strong
// アトミック: atomic or nonatomic
@property (strong, nonatomic) UIWindow *window;

@end