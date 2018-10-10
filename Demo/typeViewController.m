//
//  typeViewController.m
//  Demo
//
//  Created by 王俊钢 on 2018/10/10.
//  Copyright © 2018 wangjungang. All rights reserved.
//

#import "typeViewController.h"
#import "typeCell.h"
#import "typeModel.h"

@interface typeViewController ()<UITableViewDataSource,UITableViewDelegate,myTabVdelegate>
@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) UIView *footView;
@property (nonatomic,strong) UIButton *submitBtn;
@property (nonatomic,strong) UIView *headView;
@property (nonatomic,strong) UILabel *headLab;
@property (nonatomic,strong) NSArray *dataArray0;
@property (nonatomic,strong) NSArray *dataArray1;
@property (nonatomic,strong) NSArray *dataArray2;
@property (nonatomic,strong) NSArray *dataArray3;
@property (nonatomic,strong) NSMutableArray *inputArray;
@end

// 屏幕宽高
#define kSCREEN_HEIGHT      [UIScreen mainScreen].bounds.size.height
#define kSCREEN_WIDTH       [UIScreen mainScreen].bounds.size.width

static NSString *typeidentfity = @"typeidentfity";

@implementation typeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"选择标签";
    
    [self.view addSubview:self.table];
    self.table.tableFooterView = [UIView new];
    self.table.tableHeaderView = self.headView;
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

-(UIView *)headView
{
    if(!_headView)
    {
        _headView = [[UIView alloc] init];
        _headView.frame = CGRectMake(0, 0, kSCREEN_WIDTH, 60);
        [_headView addSubview:self.headLab];
        [_headView addSubview:self.submitBtn];
    }
    return _headView;
}

-(UIButton *)submitBtn
{
    if(!_submitBtn)
    {
        _submitBtn = [[UIButton alloc] init];
        [_submitBtn setImage:[UIImage imageNamed:@"关闭"] forState:normal];
        _submitBtn.frame = CGRectMake(kSCREEN_WIDTH-40, 8, 20, 20);
        [_submitBtn addTarget:self action:@selector(submitbtnclick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitBtn;
}

-(UILabel *)headLab
{
    if(!_headLab)
    {
        _headLab = [[UILabel alloc] init];
        _headLab.frame = CGRectMake(30, 25, kSCREEN_WIDTH-60, 26);
        _headLab.textColor = [UIColor darkGrayColor];
        _headLab.font = [UIFont systemFontOfSize:13];
        _headLab.text = @"你对什么感兴趣";
        _headLab.textAlignment = NSTextAlignmentCenter;
    }
    return _headLab;
}

#pragma mark -UITableViewDataSource&&UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    typeCell *cell = [tableView dequeueReusableCellWithIdentifier:typeidentfity];
    cell = [[typeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:typeidentfity];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    switch (indexPath.row) {
        case 0:
        {
            cell.leftLab.text = @"音乐";
            typeModel *model = [typeModel new];
            model.labColor = [UIColor greenColor];
            [cell settagview:model andarray:self.dataArray0];
        }
           
            break;
        case 1:
        {
            cell.leftLab.text = @"电影";
            typeModel *model1 = [typeModel new];
            model1.labColor = [UIColor redColor];
            [cell settagview:model1 andarray:self.dataArray1];
        }
            break;
        
        case 2:
        {
            cell.leftLab.text = @"饮食";
            typeModel *model = [typeModel new];
            model.labColor = [UIColor blueColor];
            [cell settagview:model andarray:self.dataArray2];
        }
           
            break;
        case 3:
        {
            cell.leftLab.text = @"健康";
            typeModel *model = [typeModel new];
            model.labColor = [UIColor orangeColor];
            [cell settagview:model andarray:self.dataArray3];
        }
            break;
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(NSArray *)dataArray0
{
    if(!_dataArray0)
    {
        _dataArray0 = [NSArray arrayWithObjects:@"古典",@"流行",@"摇滚",@"嘻哈",@"乡村",@"民谣", nil];;
        
    }
    return _dataArray0;
}

-(NSArray *)dataArray1
{
    if(!_dataArray1)
    {
        _dataArray1 = [NSArray arrayWithObjects:@"黑色",@"历史",@"科幻",@"喜剧",@"爱情",@"动作", nil];;
        
    }
    return _dataArray1;
}

-(NSArray *)dataArray2
{
    if(!_dataArray2)
    {
        _dataArray2 = [NSArray arrayWithObjects:@"海鲜",@"蔬菜",@"水果",@"菌类",@"奶制品",@"肉类", nil];;
        
    }
    return _dataArray2;
}

-(NSArray *)dataArray3
{
    if(!_dataArray3)
    {
        _dataArray3 = [NSArray arrayWithObjects:@"跑步",@"瑜伽",@"跳舞",@"武术",@"爬山",@"旅行", nil];;
    }
    return _dataArray3;
}

-(NSMutableArray *)inputArray
{
    if(!_inputArray)
    {
        _inputArray = [NSMutableArray array];
        
    }
    return _inputArray;
}

-(void)myTabVClick:(NSMutableArray *)array
{
    [self.inputArray addObjectsFromArray:array];
}

#pragma mark - submitbtnclick

-(void)submitbtnclick
{
    
    __weak typeof(self) weakself = self;
    if (weakself.returnValueBlock) {
        weakself.returnValueBlock(self.inputArray);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
