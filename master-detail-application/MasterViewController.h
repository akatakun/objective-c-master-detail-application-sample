#import <UIKit/UIKit.h>

// クラスの前方宣言: クラスの存在を知らせるだけであれば、Importせずともこれでいい
@class DetailViewController;


@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end