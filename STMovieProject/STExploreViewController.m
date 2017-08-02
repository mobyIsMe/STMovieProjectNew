//
//  STExploreViewController.m
//  STMovieProject
//
//  Created by 张红利 on 2017/7/28.
//  Copyright © 2017年 张红利. All rights reserved.
//

#import "STExploreViewController.h"
#import "STCommonUtil.h"

NSString* const UITableViewCellIdentifier = @"cellIdentifier";

@interface STExploreViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView* tableView;

@end

@implementation STExploreViewController

#pragma mark- property
-(UITableView*)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellIdentifier];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

#pragma  mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    
}

#pragma mark - UI
-(void)setupUI{
    //use full screen layout
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    [self.view addSubview:self.tableView];
}

#pragma mark - tableview delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - tableview datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1000;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Header";
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"Hi";
    cell.imageView.image = [STCommonUtil imageWithColor:[UIColor redColor] withSize:CGSizeMake(30, 30)];
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    return cell;
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
