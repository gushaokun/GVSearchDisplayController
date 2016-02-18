//
//  ViewController.m
//  GVSearchDisplayController
//
//  Created by Gavin on 16/2/18.
//  Copyright © 2016年 GV. All rights reserved.
//

#import "ViewController.h"
#import "GVSearchBarController.h"
#import "TableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)showSearch:(id)sender {
    TableViewController *table = [[TableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    GVSearchBarController *search = [[GVSearchBarController alloc] initWithContentController:table];
    [self.navigationController pushViewController:search animated:true];
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
