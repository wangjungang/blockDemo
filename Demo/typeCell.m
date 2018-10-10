//
//  typeCell.m
//  Demo
//
//  Created by 王俊钢 on 2018/10/10.
//  Copyright © 2018 wangjungang. All rights reserved.
//

#import "typeCell.h"
#import "typeModel.h"
#import <Masonry.h>
#import "LeeTagView.h"

@interface typeCell()<LeeTagViewDelegate,LeeTagViewDataSource>

@property (nonatomic,strong) LeeTagView *testTagView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UIColor *col;
@end

@implementation typeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.leftLab];
        [self.contentView addSubview:self.testTagView];
        [self setuplayout];
    }
    return self;
}

-(void)settagview:(typeModel *)model andarray:(NSArray *)array
{
    self.dataArray = array;
    self.col = model.labColor;
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LeeTagViewModel * tagModel = [[LeeTagViewModel alloc]init];
        tagModel.tagText = obj;
        tagModel.tagTextColor = [UIColor blackColor];
        tagModel.tagTextFontSize = 13.0f;
        tagModel.tagBgColor = [UIColor whiteColor];
        tagModel.tagSelectTextColor = [UIColor blackColor];
        tagModel.tagSelectBgColor = model.labColor;
        tagModel.tagCornerRadius = 10.0f;
        tagModel.tagBorderColor = model.labColor;
        tagModel.tagSelectBorderColor = model.labColor;
        tagModel.tagBorderWidth = 2.0f;
        tagModel.contentPadding = UIEdgeInsetsMake(3, 23, 3, 23);
        [self.testTagView addTag:tagModel];
    }];
}

-(LeeTagView *)testTagView
{
    if(!_testTagView)
    {
        _testTagView = [[LeeTagView alloc] init];
        _testTagView.delegate = self;
        _testTagView.tagViewSelectionStyle = LeeTagViewStyleSelectMulti;
        _testTagView.tagViewLineStyle = LeeTagViewLineStyleMulti;
        _testTagView.tagViewPadding = UIEdgeInsetsMake(5, 5, 5, 5);
        _testTagView.tagViewMaxWidth = self.contentView.frame.size.width;
    }
    return _testTagView;
}


-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).with.offset(14);
        make.top.equalTo(weakSelf).with.offset(20);
        make.width.mas_offset(32);
        make.height.mas_offset(15);
    }];
    [self.testTagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftLab.mas_right).with.offset(6);
        make.top.equalTo(self.contentView).with.offset(12);
        make.right.equalTo(self.contentView).with.offset(-14);
        make.bottom.equalTo(self.contentView).with.offset(-12);
    }];
}

#pragma mark - getters

-(UILabel *)leftLab
{
    if(!_leftLab)
    {
        _leftLab = [[UILabel alloc] init];
        _leftLab.font = [UIFont systemFontOfSize:12];
        _leftLab.textColor = [UIColor lightGrayColor];
    }
    return _leftLab;
}


-(void)leeTagView:(LeeTagView *)tagView tapTagButton:(LeeTagButton *)tagButton atIndex:(NSInteger)index{
    
    typeModel *model = [typeModel new];
    model.name = self.dataArray[index];
    model.labColor = self.col;
    
    NSMutableArray *arr = [NSMutableArray new];
    [arr addObject:model];
    [self.delegate myTabVClick:arr];
}

@end
