//
//  GoogleShopCell.m
//  DzyUICells
//
//  Created by Dzy on 07/07/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "GoogleShopCell.h"

#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface GoogleShopCell ()

@property (nonatomic ) UIImageView *icon;
@property (nonatomic ) UILabel *title;
@property (nonatomic ) UILabel *sub_title;
@property (nonatomic ) UIButton *downBtn;

@end

@implementation GoogleShopCell


- (void)toDown:(UIButton *)btn {

    NSLog(@"down...");

}

- (void)setModel:(NSDictionary *)model {

    _model = model;
    _title.text = model[@"title"];
    _sub_title.text = model[@"sub_title"];
    [_icon sd_setImageWithURL:[NSURL URLWithString:model[@"icon"]]];
}

- (UIButton *)downBtn {

    if (!_downBtn) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"DOWN" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 5;
        btn.layer.borderColor = [UIColor greenColor].CGColor;
        [btn addTarget:self action:@selector(toDown:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.borderWidth = 1.0f;
        _downBtn = btn;
    }
    return _downBtn;

}

- (UILabel *)sub_title {
    
    if (!_sub_title) {
        UILabel *l = [[UILabel alloc] init];
        l.text = @"All people will choose";
        l.textColor = [UIColor grayColor];
        l.font = [UIFont systemFontOfSize:14];
        _sub_title = l;
    }
    return _sub_title;
}

- (UILabel *)title {

    if (!_title) {
        UILabel *l = [[UILabel alloc] init];
        l.text = @"StudyLiving";
        l.textColor = [UIColor darkTextColor];
        l.font = [UIFont systemFontOfSize:16];
        _title = l;
    }
    return _title;
    
}

- (UIImageView *)icon {

    if (!_icon) {
        UIImageView *img = [[UIImageView alloc] init];
        img.clipsToBounds = YES;
        img.contentMode = UIViewContentModeScaleAspectFill;
        _icon = img;
    }
    return _icon;
    
}

- (void)makeFrame {

    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@40);
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];

    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).offset(10);
        make.top.equalTo(_icon.mas_top);
    }];
    
    [_sub_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).offset(10);
        make.bottom.equalTo(_icon.mas_bottom);
    }];
    
    [_downBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];

}

- (void)createUI {
    
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.sub_title];
    [self.contentView addSubview:self.downBtn];

    [self makeFrame];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

+ (instancetype)cellForTableVIew:(UITableView *)tableView {
    
    GoogleShopCell *cell = [tableView dequeueReusableCellWithIdentifier:GoogleShopCell_id];
    if (!cell) {
        cell = [[GoogleShopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GoogleShopCell_id];
    }
    return cell;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
