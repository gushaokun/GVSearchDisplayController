//
//  GVSearchBarDisplayController.m
//  GVSearchDisplayController
//
//  Created by kaoke on 16/1/29.
//  Copyright © 2016年 GV. All rights reserved.
//

#import "GVSearchBarDisplayController.h"

@interface GVSearchBarDisplayController ()<UISearchDisplayDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *searchTableView;
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

-(UITableView*)searchTableView
{
    if (!_searchTableView) {
        _searchTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:_searchTableViewStyle];
        _searchTableView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        _searchTableView.delegate = self;
        _searchTableView.dataSource = self;
        [self.view addSubview:_searchTableView];
    }
    return _searchTableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([_delegate respondsToSelector:@selector(gv_searchDisplayController:didLoadSearchResultsTableView:)]) {
        [_delegate gv_searchDisplayController:self didLoadSearchResultsTableView:self.searchTableView];
    }
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
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
