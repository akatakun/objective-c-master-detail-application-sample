#import <UIKit/UIKit.h>

// プロトコルの前方宣言
// セミコロンで終われば前方宣言
@protocol AddItemViewControllerDelegate;

@interface AddItemViewController : UITableViewController
 
@property (weak, nonatomic) id<AddItemViewControllerDelegate> delegate;
 
@end

// デリゲートの定義(実装はなし)
@protocol AddItemViewControllerDelegate <NSObject>
 
- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller;
 
- (void)addItemViewControllerDidFinish:(AddItemViewController *)controller item:(NSString *)item;
 
@end