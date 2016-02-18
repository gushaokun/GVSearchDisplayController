//
//  GVSearchBarDisplayController.m
//  GVSearchDisplayController
//
//  Created by kaoke on 16/1/29.
//  Copyright © 2016年 GV. All rights reserved.
//

#import "GVSearchBarDisplayController.h"

@interface GVSearchBarDisplayController ()<UIGestureRecognizerDelegate>
@property(nonatomic,assign)UITableViewStyle searchTableViewStyle;
@end

@implementation GVSearchBarDisplayController
- (instancetype)init
{
    self = [super init];
    if (self) {
        _searchTableViewStyle = UITableViewStylePlain;
    }
    return self;
}
-(void)setDelegate:(id<GVSearchBarDisplayDelegate>)delegate
{
    _delegate = delegate;
    _searchTableView.delegate = (id<UITableViewDelegate>)delegate;
    _searchTableView.dataSource = (id<UITableViewDataSource>)delegate;
}
-(instancetype)initWithSearchBar:(GVSearchBarView *)searchBar searchTableStyle:(UITableViewStyle)searchTableStyle
{
    self = [super init];
    if (self) {
        _searchBarView = searchBar;
        _searchTableViewStyle = searchTableStyle;
        _searchBarView.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
        _searchBarView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self.view addSubview:_searchBarView];
        [self searchTableView];
    }
    return self;
}
-(void)setActive:(BOOL)active
{
    _active = active;
    UIViewController *content = self.parentViewController.childViewControllers.firstObject;
    if (active) {
        [self.parentViewController transitionFromViewController:content toViewController:self duration:.35 options:UIViewAnimationOptionLayoutSubviews animations:nil completion:^(BOOL finished) {
        }];
        
    }else{
        [self.parentViewController transitionFromViewController:self toViewController:content duration:.35 options:UIViewAnimationOptionLayoutSubviews animations:nil completion:^(BOOL finished) {
        }];
    }
}
-(void)setActive:(BOOL)active animated:(BOOL)animated
{
    [self setActive:active];
    [self.parentViewController.navigationController setNavigationBarHidden:active animated:animated];

}
-(UITableView*)searchTableView
{
    if (!_searchTableView) {
        _searchTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:_searchTableViewStyle];
        _searchTableView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
        [self.view addSubview:_searchTableView];
    }
    return _searchTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    if ([_delegate respondsToSelector:@selector(gv_searchDisplayController:didLoadSearchResultsTableView:)]) {
        [_delegate gv_searchDisplayController:self didLoadSearchResultsTableView:self.searchTableView];
    }
    // Do any additional setup after loading the view.
}
-(void)tap:(UITapGestureRecognizer*)tap{
    [_searchBarView.searchBar resignFirstResponder];
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isKindOfClass: NSClassFromString(@"UITableViewCellContentView")]) {
        return false;
    }
    return true;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([_delegate respondsToSelector:@selector(gv_searchDisplayController:willShowSearchResultsTableView:)]) {
        [_delegate gv_searchDisplayController:self willShowSearchResultsTableView:_searchTableView];
    }
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if ([_delegate respondsToSelector:@selector(gv_searchDisplayController:didShowSearchResultsTableView:)]) {
        [_delegate gv_searchDisplayController:self didShowSearchResultsTableView:_searchTableView];
    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if ([_delegate respondsToSelector:@selector(gv_searchDisplayController:willHideSearchResultsTableView:)]) {
        [_delegate gv_searchDisplayController:self willHideSearchResultsTableView:_searchTableView];
    }
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if ([_delegate respondsToSelector:@selector(gv_searchDisplayController:didHideSearchResultsTableView:)]) {
        [_delegate gv_searchDisplayController:self didHideSearchResultsTableView:_searchTableView];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
