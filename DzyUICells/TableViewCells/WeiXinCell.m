//
//  WeiXinCell.m
//  DzyUICells
//
//  Created by Dzy on 20/06/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "WeiXinCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#define CurrentWidth [UIScreen mainScreen].bounds.size.width

@interface WeiXinCell ()

@property (nonatomic ) UIImageView *userIcon;
@property (nonatomic ) UIImageView *icon;
@property (nonatomic ) UILabel *name;
@property (nonatomic ) UILabel *message;

@end

@implementation WeiXinCell

- (void)setModel:(NSDictionary *)model {
    
    _model = model;
    
    _name.text = model[@"name"];
    _message.text = model[@"message"];

    [_icon sd_setImageWithURL:[NSURL URLWithString:model[@"url"]] completed:nil];
    
    // let server return size then update icon frame
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(100));
        make.height.equalTo(@(160));
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(_message.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
}

- (UIImageView *)userIcon {

    if (!_userIcon) {
        UIImageView *icon = [[UIImageView alloc] init];
        icon.backgroundColor = [UIColor redColor];
        _userIcon = icon;
    }
    return _userIcon;

}

- (UIImageView *)icon {
    
    if (!_icon) {
        UIImageView *icon = [[UIImageView alloc] init];
        icon.contentMode = UIViewContentModeScaleAspectFit;
        _icon = icon;
    }
    return _icon;
}

- (UILabel *)name {
    
    if (!_name) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor darkTextColor];
        l.font = [UIFont systemFontOfSize:16];
        _name = l;
    }
    return _name;
}

-(UILabel *)message {
    
    if (!_message) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor grayColor];
        l.font = [UIFont systemFontOfSize:14];
        l.numberOfLines = 0;
        _message = l;
    }
    return _message;
}

- (void)makeFrame {

    [_userIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.width.height.equalTo(@20);
    }];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_userIcon.mas_right).offset(10);
        make.centerY.equalTo(_userIcon);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    
    [_message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(_userIcon.mas_bottom).offset(10);
        make.width.equalTo(@(CurrentWidth - 20));
//        make.bottom.equalTo(self.contentView).offset(-10);
    }];

    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(CurrentWidth/2));
        make.width.equalTo(@(CurrentWidth/2));
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(_message.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
}

- (void)createUI {
    
    [self.contentView addSubview:self.userIcon];
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.message];
    [self.contentView addSubview:self.icon];

    [self makeFrame];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

+ (instancetype)cellForTableVIew:(UITableView *)tableView {
    
    WeiXinCell *cell = [tableView dequeueReusableCellWithIdentifier:WeiXinCell_id];
    if (!cell) {
        cell = [[WeiXinCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WeiXinCell_id];
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
