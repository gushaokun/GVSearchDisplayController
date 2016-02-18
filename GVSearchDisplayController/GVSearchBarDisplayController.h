//
//  GVSearchBarDisplayController.h
//  GVSearchDisplayController
//
//  Created by kaoke on 16/1/29.
//  Copyright © 2016年 GV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GVSearchBarView.h"

@class GVSearchBarDisplayController;

@protocol GVSearchBarDisplayDelegate <NSObject>
@optional

// when we start/end showing the search UI

- (void) gv_searchDisplayControllerWillBeginSearch:(GVSearchBarDisplayController *)controller;
- (void) gv_searchDisplayControllerDidBeginSearch:(GVSearchBarDisplayController *)controller;
- (void) gv_searchDisplayControllerWillEndSearch:(GVSearchBarDisplayController *)controller;
- (void) gv_searchDisplayControllerDidEndSearch:(GVSearchBarDisplayController *)controller;

// called when the table is created destroyed, shown or hidden. configure as necessary.

- (void)gv_searchDisplayController:(GVSearchBarDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView;

- (void)gv_searchDisplayController:(GVSearchBarDisplayController *)controller willUnloadSearchResultsTableView:(UITableView *)tableView;

// called when table is shown/hidden
- (void)gv_searchDisplayController:(GVSearchBarDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView;

- (void)gv_searchDisplayController:(GVSearchBarDisplayController *)controller didShowSearchResultsTableView:(UITableView *)tableView;

- (void)gv_searchDisplayController:(GVSearchBarDisplayController *)controller willHideSearchResultsTableView:(UITableView *)tableView;

- (void)gv_searchDisplayController:(GVSearchBarDisplayController *)controller didHideSearchResultsTableView:(UITableView *)tableView ;

// return YES to reload table. called when search string/option changes. convenience methods on top UISearchBar delegate methods

- (BOOL)gv_searchDisplayController:(GVSearchBarDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString;

- (BOOL)gv_searchDisplayController:(GVSearchBarDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption;

@end


@interface GVSearchBarDisplayController : UIViewController
@property (nonatomic,readonly)GVSearchBarView *searchBarView;
@property(nonatomic,strong)UITableView *searchTableView;
@property(nonatomic,weak)id<GVSearchBarDisplayDelegate>delegate;
@property(nonatomic,assign)BOOL active;
-(void)setActive:(BOOL)active animated:(BOOL)animated;
-(instancetype)initWithSearchBar:(GVSearchBarView*)searchBar searchTableStyle:(UITableViewStyle)searchTableStyle;
@end
