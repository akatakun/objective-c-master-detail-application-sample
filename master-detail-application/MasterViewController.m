#import "MasterViewController.h"
#import "DetailViewController.h"

#import "AddItemViewController.h"

@interface MasterViewController () <AddItemViewControllerDelegate>

@property NSMutableArray *objects; // 多分テーブル要素

@end


@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller {
    NSLog(@"addItemViewControllerDidCancel");
    
    // 画面を閉じるメソッドを呼ぶ
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)addItemViewControllerDidFinish:(AddItemViewController *)controller item:(NSString *)item {
    NSLog(@"addItemViewControllerDidFinish item:%@",item);
    
    // 保存するための配列の準備ができていない場合は、配列を生成し、初期化する
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    // 受け取ったitemを配列に格納する
    [_objects insertObject:item atIndex:0];
    
    // TableViewに行を挿入する
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    // 画面を閉じるメソッドを呼ぶ
    [self dismissViewControllerAnimated:YES completion:NULL];
}


#pragma mark - Segues

// 画面遷移時に呼び出される
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // MasterViewからAddItemViewに遷移するならば
    if ([[segue identifier] isEqualToString:@"ShowAddItemView"]) {
        
        // 遷移先のAddItemViewControllerのインスタンスを取得
        AddItemViewController *addItemViewController = (AddItemViewController *)[[[segue destinationViewController]viewControllers]objectAtIndex:0];
        
        // delegateプロパティに self(MasterViewController自身)をセット
        addItemViewController.delegate = self;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}

@end