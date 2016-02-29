#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    // オートリリース
    // 循環参照に注意
    // コンパイラディレクティブ: C言語にはない、独自の概念や処理を明示するために用意された"@"から始まる構文
    @autoreleasepool {
        // アプリケーションを初期化する
        // 3: Application class(default: UIApplication)
        // 4: Application delegate class(optional)
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}