//
//  GVSearchBarView.h
//  GVSearchDisplayController
//
//  Created by kaoke on 16/1/29.
//  Copyright © 2016年 GV. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GVSearchBarViewDelegate <NSObject>
@optional
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar;              - (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar;
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar;
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;                  - (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar;
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar;
- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar;
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope;
@end

@interface GVSearchBarView : UIView<UISearchBarDelegate>
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)UIImageView *backgroundView;
@end
