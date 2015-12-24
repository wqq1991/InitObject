/********************************************************************
 文件名称 : BaseTableViewController.m 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/3/10
 文件描述 : 类
 *********************************************************************/

#import "BaseTableViewController.h"
//#import "SRRefreshView.h"
//#import "MJRefresh.h"

@interface BaseTableViewController ()
//<SRRefreshDelegate>
//@property (nonatomic, strong) SRRefreshView *slimeView;
@end

@implementation BaseTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //数据的初始化
        self.contentArray = [NSMutableArray array];
        self.lastUpdateTime = @"";
        self.currentPage = 1;
        self.tableViewRowHeight = 0;
        self.refreshState = RefreshControlWaitRefresh;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
 
}

/**
 *初始化UITableView
 */
- (void)initTableViewWithStyle:(UITableViewStyle )style
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.mTableView = tableView;
    [self.view addSubview:self.mTableView];
    
    self.tableViewRowHeight = 90;
    
    tableView.clipsToBounds = NO;
    
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(tableView);
    
    NSString *HVisualFormat = [NSString stringWithFormat:@"H:|-%f-[tableView]-%f-|",self.edgeInsets.left,self.edgeInsets.right];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:HVisualFormat
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];

    NSString *VisualFormat = [NSString stringWithFormat:@"V:|-%f-[tableView]-%f-|",self.edgeInsets.top,self.edgeInsets.bottom];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:VisualFormat
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
    [self addRefreshControl:tableView];
}

/**
 添加一个下拉刷新控件
 */
-(void)addRefreshControl:(UITableView *)tableView
{
    //系统默认的刷新 (弃用)
//    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
//    refreshControl.tintColor = [UIColor grayColor];
//    [refreshControl addTarget:self action:@selector(headerBeginRefreshing) forControlEvents:UIControlEventValueChanged];
//    self.refreshControl = refreshControl;
//    [tableView addSubview:self.refreshControl];
//    [tableView sendSubviewToBack:self.refreshControl];
    
    //
//    _slimeView = [[SRRefreshView alloc] init];
//    _slimeView.delegate = self;
//    _slimeView.upInset = 0;
//    _slimeView.slimeMissWhenGoingBack = YES;
//    _slimeView.slime.bodyColor = UIColorFromRGB(0x9c9c9c);//[UIColor clearColor];
//    _slimeView.slime.skinColor = [UIColor whiteColor];//kNavBackgroundColor
//    _slimeView.activityIndicationView.color = UIColorFromRGB(0x9c9c9c);//[UIColor whiteColor];
//    _slimeView.slime.lineWith = 1.0f;
//    _slimeView.slime.shadowBlur = 4;
//    _slimeView.slime.shadowColor = [UIColor whiteColor];//kNavBackgroundColor;
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [tableView addSubview:_slimeView];
//        [_slimeView bringSubviewToFront:tableView];
//    });
    
    //添加MJRefresh
//    [tableView addHeaderWithTarget:self action:@selector(headerBeginRefreshing)];
//    tableView.headerPullToRefreshText = @"下拉开始刷新...";
//    tableView.headerRefreshingText = @"加载中...";
//    tableView.headerReleaseToRefreshText = @"释放即可刷新...";
//     
//    [tableView headerBeginRefreshing];
}

#pragma mark - scrollView delegate

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    [_slimeView scrollViewDidScroll];
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    [_slimeView scrollViewDidEndDraging];
//}
//
//#pragma mark - slimeRefresh delegate
//
//- (void)slimeRefreshStartRefresh:(SRRefreshView *)refreshView
//{
//    [self headerBeginRefreshing];
//    [_slimeView performSelector:@selector(endRefresh)
//                     withObject:nil afterDelay:5
//                        inModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
//}

/**
 移除下拉刷新控件
 */
-(void)removeRefreshControl;
{
    [self.refreshControl removeTarget:self
                               action:@selector(headerBeginRefreshing)
                     forControlEvents:UIControlEventValueChanged];
    
    [self.refreshControl removeFromSuperview];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        [_slimeView removeFromSuperview];
//    });
    
//    [self.mTableView removeHeader];
}

/**
 *刷新事件
 */
-(void)headerBeginRefreshing
{
    self.currentPage = 1;
    self.refreshState = RefreshControlRefreshing;
    
    double delayInSeconds = 10.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        [self endRefreshing];
    });

}
/**
 刷新列表
 */
-(void)reloadTableViewData
{
    [self endRefreshing];
    [self.mTableView reloadData];
}

-(void)endRefreshing
{
     self.refreshState = RefreshControlWaitRefresh;
    [self.refreshControl endRefreshing];
    
//    [_slimeView endRefresh];
//    [self.mTableView headerEndRefreshing];

}


#pragma mark ---------------------代理方法--------------------
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return self.tableViewRowHeight;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.contentArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
 
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self.contentArray[indexPath.row];
    
    return cell;
}


//ios 7,8 设置 分割线0为起点
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

//ios 7,8 设置 分割线0为起点
-(void)viewDidLayoutSubviews
{
    if ([self.mTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.mTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.mTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.mTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
