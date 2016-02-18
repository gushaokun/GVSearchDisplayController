//
//  ViewController.m
//  GVsearchBarDisplayController
//
//  Created by kaoke on 16/1/29.
//  Copyright © 2016年 GV. All rights reserved.
//

#import "GVSearchBarController.h"

@interface GVSearchBarController ()<GVSearchBarDisplayDelegate,UISearchBarDelegate>
@property(nonatomic,strong)UIViewController *contentController;
@end

@implementation GVSearchBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _searchBarView = [[GVSearchBarView alloc] init];
        _searchBarView.searchBar.delegate = self;
        _searchBarView.backgroundView.backgroundColor = [UIColor colorWithWhite:.95 alpha:1];
        _searchBarDisplayController = [[GVSearchBarDisplayController alloc] initWithSearchBar:_searchBarView searchTableStyle:UITableViewStylePlain];
        _searchBarDisplayController.delegate = self;
        [self addChildViewController:_searchBarDisplayController];
    }
    return self;
}
-(instancetype)initWithContentController:(UIViewController*)contentController{
    
    self = [super init];
    if (self) {
        
        contentController.view.frame = self.view.bounds;
        contentController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:contentController.view];
        [self addChildViewController:contentController];
        
        _searchBarView = [[GVSearchBarView alloc] init];
        _searchBarView.searchBar.delegate = self;
        _searchBarView.backgroundView.backgroundColor = [UIColor colorWithWhite:.95 alpha:1];
        _searchBarDisplayController = [[GVSearchBarDisplayController alloc] initWithSearchBar:_searchBarView searchTableStyle:UITableViewStylePlain];
        _searchBarDisplayController.delegate = (id<GVSearchBarDisplayDelegate>)contentController;
        [self addChildViewController:_searchBarDisplayController];
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:_searchBarDisplayController.active animated:true];
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:true animated:true];
    return true;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:false animated:true];
    return true;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
}
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return true;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    [searchBar resignFirstResponder];
    
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBarDisplayController setActive:false animated:true];
    searchBar.text = nil;
    [searchBar resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
