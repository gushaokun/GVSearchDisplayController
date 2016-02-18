//
//  GVSearchBarView.m
//  GVSearchDisplayController
//
//  Created by kaoke on 16/1/29.
//  Copyright © 2016年 GV. All rights reserved.
//

#import "GVSearchBarView.h"

@implementation GVSearchBarView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self backgroundView];
        [self searchBar];
    }
    return self;
}
-(UISearchBar*)searchBar
{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, -44, self.frame.size.width, 44)];
        _searchBar.backgroundImage = [[UIImage alloc] init];
        _searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
        _searchBar.showsCancelButton = true;
        [_searchBar setTranslucent:true];
        [self addSubview:_searchBar];
    }
    return _searchBar;
}
-(UIImageView*)backgroundView
{
    if (!_backgroundView) {
        _backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
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
