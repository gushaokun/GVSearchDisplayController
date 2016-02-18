//
//  GVSearchBarView.h
//  GVSearchDisplayController
//
//  Created by kaoke on 16/1/29.
//  Copyright © 2016年 GV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GVSearchBarView : UIView<UISearchBarDelegate>
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)UIImageView *backgroundView;
@end
