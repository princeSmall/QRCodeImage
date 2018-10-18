//
//  ViewController.m
//  QRCode
//
//  Created by iOS on 2017/9/7.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "ViewController.h"
#import "QRCodeViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView * QRTableView;

@property (nonatomic,strong)NSArray * QRArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"二维码";
    self.QRArray = [[NSArray alloc]initWithObjects:@"原始二维码",@"原始条形码",@"彩色二维码",@"彩色条形码",@"渐变二维码", nil];
    

    self.QRTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.QRTableView.delegate =self;
    self.QRTableView.dataSource = self;
    [self.view addSubview:self.QRTableView];
    self.QRTableView.tableFooterView = [UIView new];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.QRArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * identifier = @"cell";
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    cell.textLabel.text =self.QRArray[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor redColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QRCodeViewController * QRCode = [[QRCodeViewController alloc]init];
    QRCode.type = indexPath.row;
    QRCode.QRTitle = self.QRArray[indexPath.row];
    [self.navigationController pushViewController:QRCode animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
