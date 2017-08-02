//
//  STMainViewController.m
//  STMovieProject
//
//  Created by 张红利 on 2017/7/28.
//  Copyright © 2017年 张红利. All rights reserved.
//

#import "STMainViewController.h"
#import "STDetailViewController.h"

@interface STMainViewController ()

@end

@implementation STMainViewController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

-(void)setupUI{
    //use full screen layout
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    //navigation item
    UIBarButtonItem* detailButton = [[UIBarButtonItem alloc]initWithTitle:@"Detail" style:UIBarButtonItemStylePlain target:self action:@selector(gotoDetailPage)];
    self.navigationItem.rightBarButtonItem = detailButton;
    
    //hello button
    UIButton* helloButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [helloButton setTitle:@"Hello" forState:UIControlStateNormal];
    [helloButton addTarget:self action:@selector(onHelloButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    helloButton.frame = CGRectMake(50, 150, 50, 50);
    helloButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:helloButton];
//    [helloButton mas_makeContraints:^(MASConstraintMaker* make){
//    
//    }]
}

#pragma  mark - action
-(void)gotoDetailPage{
    STDetailViewController* detailController = [[STDetailViewController alloc]init];
    detailController.hidesBottomBarWhenPushed = YES;//push到详情页，底部的tabbar隐藏
    [self.navigationController pushViewController:detailController animated:YES];
}

-(void)onHelloButtonClicked:(id)sender{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Hello,moby!" message:@"How U doing?" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"ok clicked!");
    }]];
    [self presentViewController:alert animated:YES completion:nil];
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
