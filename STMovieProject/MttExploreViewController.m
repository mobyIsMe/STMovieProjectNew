//
//  MttExploreViewController.m
//  MttHD
//
//  Created by 张红利 on 2017/8/1.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import "MttExploreViewController.h"
#import "StMovieService.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "STCommonUtil.h"
#import "SVProgressHUD.h"


static NSString* const cellIdentifier = @"cellIdentifier";

@interface MttExploreViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong, nonatomic)UITableView* tableView;
@property(strong, nonatomic)NSArray* movieList;

@end

@implementation MttExploreViewController

#pragma mark- property
-(UITableView*)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    [self requestData];
}

#pragma mark- UI
-(void)setupUI{
    //use fullscreen layout
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    [self.view addSubview:self.tableView];
}

-(void)requestData{
    NSDictionary* params = @{@"pageLimit":@30,@"pageNum": @1};
    typeof(self) __weak weakSelf = self;
    UIActivityIndicatorView* indictor = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    [StMovieService requestMovieDataWithParamaters:params start:^{
//        
////        typeof(weakSelf) __strong strongSelf = weakSelf;
////        indictor.center  = strongSelf.view.center;
////        [strongSelf.view addSubview:indictor];
//        [SVProgressHUD show];
//        
//    } success:^(NSDictionary *result) {
//        
//        typeof(weakSelf) __strong strongSelf = weakSelf;
//        strongSelf.movieList = [result objectForKey:@"movieList"];
//        [strongSelf.tableView reloadData];
//        //[indictor removeFromSuperview];
//        [SVProgressHUD dismiss];
//
//    } failure:^(NSError *error) {
//        [SVProgressHUD dismiss];
//    }];
    [StMovieService getJsonDataWithJsonFilenName:@"movie" start:^{
        [SVProgressHUD show];
    } success:^(NSDictionary *result) {
        typeof(weakSelf) __strong strongSelf = weakSelf;
        strongSelf.movieList = [result objectForKey:@"movieList"];
        [strongSelf.tableView reloadData];
        //[indictor removeFromSuperview];
        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
}


#pragma mark - tableview delegate
- (void) tableView: (UITableView*)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView: (UITableView*)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 50;
}

#pragma mark- tableview datasource delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView{
    return 1;
}

- (NSInteger)tableView: (UITableView*) tableView numberOfRowsInSection:(NSInteger)section{
    return self.movieList.count;
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if(indexPath.row > self.movieList.count){
        return nil;
    }
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    STMovieModel* model = [self.movieList objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", model.name,model.year];
    cell.detailTextLabel.text = model.synopsis;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.thumbnailImageUrlStr] placeholderImage:[STCommonUtil imageWithColor:[UIColor grayColor] withSize:CGSizeMake(27, 40)] completed:nil];
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
