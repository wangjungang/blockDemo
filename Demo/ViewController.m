//
//  ViewController.m
//  Demo
//
//  Created by 王俊钢 on 2018/10/10.
//  Copyright © 2018 wangjungang. All rights reserved.
//

#import "ViewController.h"
#import "homeCell.h"
#import "typeViewController.h"
#import "typeModel.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) NSArray *nameArr;
@property (nonatomic,copy) NSMutableArray *dataSource;
@end

// 屏幕宽高
#define kSCREEN_HEIGHT      [UIScreen mainScreen].bounds.size.height
#define kSCREEN_WIDTH       [UIScreen mainScreen].bounds.size.width

static NSString *identfity = @"identfity";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.table];
    self.table.tableFooterView = [UIView new];
}

#pragma mark - getters

-(UITableView *)table
{
    if(!_table)
    {
        _table = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _table.dataSource = self;
        _table.delegate = self;
    }
    return _table;
}

-(NSArray *)nameArr
{
    if(!_nameArr)
    {
        _nameArr = [[NSArray alloc] initWithObjects:@"昵称",@"性别",@"简介",@"行业",@"位置",@"公司",@"家乡",@"微博",@"标签",@"兴趣", nil];
        
    }
    return _nameArr;
}

-(NSMutableArray *)dataSource
{
    if(!_dataSource)
    {
        _dataSource = [NSMutableArray array];
        
    }
    return _dataSource;
}


#pragma mark -UITableViewDataSource&&UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    homeCell *cell = [tableView dequeueReusableCellWithIdentifier:identfity];
    cell = [[homeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfity];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.nameLab.text = self.nameArr[indexPath.row];
    if (indexPath.row==8) {
        cell.contentLab.tag = 1001;
        [cell settagview:self.dataSource];
    }
   

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    typeViewController *vc = [typeViewController new];
    vc.returnValueBlock = ^(NSMutableArray *passedValue){
       
        self.dataSource = passedValue;
        [self.table reloadData];
    };
    [self.navigationController pushViewController:vc animated:YES];
}

@end
