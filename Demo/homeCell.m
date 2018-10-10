//
//  homeCell.m
//  Demo
//
//  Created by 王俊钢 on 2018/10/10.
//  Copyright © 2018 wangjungang. All rights reserved.
//

#import "homeCell.h"
#import <Masonry.h>
#import "LeeTagView.h"
#import "typeModel.h"


@interface homeCell()<LeeTagViewDelegate,LeeTagViewDataSource>
@property (nonatomic,strong) LeeTagView *tagView;
@end

@implementation homeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.tagView];
        [self setuplayout];
    }
    return self;
}

-(void)settagview:(NSArray *)array
{
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LeeTagViewModel * tagModel = [[LeeTagViewModel alloc]init];
        typeModel *tmodel = [array objectAtIndex:idx];
        tagModel.tagText = tmodel.name;
        tagModel.tagTextColor = [UIColor blackColor];
        tagModel.tagTextFontSize = 13.0f;
        tagModel.tagBgColor = tmodel.labColor;
        tagModel.tagSelectTextColor = [UIColor blackColor];
        tagModel.tagSelectBgColor = tmodel.labColor;
        tagModel.tagCornerRadius = 10.0f;
        tagModel.tagBorderColor = tmodel.labColor;
        tagModel.tagSelectBorderColor = tmodel.labColor;
        tagModel.tagBorderWidth = 2.0f;
        tagModel.contentPadding = UIEdgeInsetsMake(3, 23, 3, 23);
        [self.tagView addTag:tagModel];
    }];
}


-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf).with.offset(14);
        make.width.mas_offset(60);

    }];

    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab.mas_right).with.offset(6);
        make.top.equalTo(self.contentView).with.offset(12);
        make.right.equalTo(self.contentView).with.offset(-14);
       
    }];
    
}



#pragma mark - getters

-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [[UILabel alloc] init];
        _nameLab.font = [UIFont systemFontOfSize:14];
        _nameLab.textColor = [UIColor darkGrayColor];
    }
    return _nameLab;
}

-(LeeTagView *)tagView
{
    if(!_tagView)
    {
        _tagView = [[LeeTagView alloc] init];
        _tagView.delegate = self;
        _tagView.tagViewSelectionStyle = LeeTagViewStyleSelectDisable;
        _tagView.tagViewLineStyle = LeeTagViewLineStyleMulti;
        _tagView.tagViewPadding = UIEdgeInsetsMake(5, 5, 5, 5);
        _tagView.tagViewMaxWidth = self.contentView.frame.size.width;
    }
    return _tagView;
}



-(void)leeTagView:(LeeTagView *)tagView tapTagButton:(LeeTagButton *)tagButton atIndex:(NSInteger)index
{
    
}

@end
