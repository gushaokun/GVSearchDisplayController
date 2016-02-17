//
//  GVSearchBarView.m
//  GVSearchDisplayController
//
//  Created by kaoke on 16/1/29.
//  Copyright © 2016年 GV. All rights reserved.
//

#import "GVSearchBarView.h"

@implementation GVSearchBarView
-(UISearchBar*)searchBar
{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:self.bounds];
        _searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:_searchBar];
    }
    return _searchBar;
}
-(UIImageView*)backgroundView
{
    if (!_backgroundView) {
        _backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_backgroundView];
    }
    return _backgroundView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
