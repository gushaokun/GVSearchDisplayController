//
//  ViewController.h
//  GVSearchDisplayController
//
//  Created by kaoke on 16/1/29.
//  Copyright © 2016年 GV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GVSearchBarView.h"
#import "GVSearchBarDisplayController.h"

@interface GVSearchBarController : UIViewController
@property(nonatomic,strong)GVSearchBarDisplayController *searchBarDisplayController;
@property(nonatomic,strong)GVSearchBarView *searchBarView;
-(instancetype)initWithContentController:(UIViewController*)contentController;
@end

