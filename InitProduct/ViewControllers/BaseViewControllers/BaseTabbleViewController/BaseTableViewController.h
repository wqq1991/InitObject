/********************************************************************
 文件名称 : BaseTableViewController.h 文件
 作   者 : WuQiaoqiao
 创建时间 : 15/3/10
 文件描述 : 类
 *********************************************************************/

#import "BaseViewController.h"

typedef enum : NSUInteger
{
    RefreshStatusHeader  = 0,
    RefreshStatusFoot = 1,
} RefreshControlRefreshType;

typedef NS_ENUM(NSUInteger, RefreshControlState) {
    
    RefreshControlWaitRefresh,
    RefreshControlRefreshing,
};

@interface BaseTableViewController : BaseViewController
<UITableViewDataSource,UITableViewDelegate>

#pragma mark ---------------------接口API--------------------

/**
 *初始化UITableView
 */
- (void)initTableViewWithStyle:(UITableViewStyle )style;

/**
 *  @author qiaoqiao.wu, 15-03-10 17:03:37
 *
 *  列表行高度
 */
@property (nonatomic, assign) CGFloat tableViewRowHeight;
@property (nonatomic, assign) UIEdgeInsets edgeInsets;
@property (nonatomic, assign) RefreshControlState refreshState;
/**
 *  @author qiaoqiao.wu, 15-03-10 17:03:52
 *
 *  mTableView 对象
 */
@property (nonatomic, strong) UITableView *mTableView;

/**
 *  @author qiaoqiao.wu, 15-03-10 17:03:12
 *
 *  UIRefreshControl
 *
 *  @param nonatomic nonatomic description
 *  @param strong    strong description
 *
 *  @return return value description
 */
@property (nonatomic, strong) UIRefreshControl *refreshControl;

/**
 列表最后刷新时间.
 */
@property (nonatomic, strong) NSString *lastUpdateTime;
/**
 列表分页需要用到,表示当前页的值
 */
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger receiveCount;

/**
 列表的刷新状态,判断是否上拉 和下拉
 */
@property (nonatomic, assign)  RefreshControlRefreshType refreshType;

/**
 存储列表数据的数组容器
 */
@property (nonatomic, strong) NSMutableArray *contentArray;

/**
 添加一个下拉刷新控件(默认是添加)
 */
-(void)addRefreshControl:(UITableView *)tableView;

/**
 移除下拉刷新控件
 */
-(void)removeRefreshControl;

/**
 *  下拉刷新事件方法. @author qiaoqiao.wu, 15-03-10 17:03:38
 */
-(void)headerBeginRefreshing;

/**
 *  刷新列表数据,同时结束刷新  @author qiaoqiao.wu, 15-03-10 17:03:06
 */
-(void)reloadTableViewData;

/**
 *  结束刷新状态 @author qiaoqiao.wu, 15-03-10 17:03:02
 */
-(void)endRefreshing;;

@end
