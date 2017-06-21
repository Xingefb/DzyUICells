//
//  QQMessageCell.m
//  DzyUICells
//
//  Created by Dzy on 21/06/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "QQMessageCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIView+XWAddForRoundedCorner.h"
#define CurrentWidth [UIScreen mainScreen].bounds.size.width

@interface QQMessageCell ()

@property (nonatomic ) UIImageView *icon;
@property (nonatomic ) UILabel *name;
@property (nonatomic ) UILabel *message;

@property (nonatomic ) UILabel *time;
@property (nonatomic ) UILabel *redDot;


@end

@implementation QQMessageCell


- (void)setModel:(NSDictionary *)model {

    _model = model;
    _time.text = model[@"time"];
    _name.text = model[@"name"];
    _message.text = model[@"message"];
    [_icon sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954257052&di=e33d51616d4c6c47076e2e6ae76abf1c&imgtype=0&src=http%3A%2F%2Fimg4.cache.netease.com%2Fgame%2F2015%2F6%2F18%2F201506182245552111c.jpg"]];
    _redDot.text = @"99";
}

- (void)makeFrame {

    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        make.width.height.equalTo(@40);
    }];

    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_icon);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).offset(10);
        make.top.equalTo(_icon);
        make.right.equalTo(_time.mas_left).offset(-10);
    }];
    
    [_message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name);
        make.bottom.equalTo(_icon.mas_bottom);
        make.right.equalTo(self.contentView.mas_right).offset(-40);
    }];

    [_redDot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@15);
        make.top.equalTo(_icon).offset(-5);
        make.right.equalTo(_icon.mas_right).offset(5);
    }];
    
}

- (void)createUI {
    
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.time];
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.message];
    [self.contentView addSubview:self.redDot];

    [self makeFrame];
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
        _message = l;
    }
    return _message;
}

- (UILabel *)time {
    if (!_time) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor grayColor];
        l.textAlignment = 2;
        l.font = [UIFont systemFontOfSize:14];
        _time = l;
    }
    return _time;
}

- (UILabel *)redDot {

    if (!_redDot) {
        UILabel *l = [[UILabel alloc] init];
        l.backgroundColor = [UIColor redColor];
        l.textAlignment = 1;
        [l xw_roundedCornerWithRadius:7.5f cornerColor:[UIColor whiteColor]];
        l.adjustsFontSizeToFitWidth = YES;
        l.font = [UIFont systemFontOfSize:12];
        l.textColor = [UIColor whiteColor];
        _redDot = l;
    }
    return _redDot;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

+ (instancetype)cellForTableVIew:(UITableView *)tableView {
    
    QQMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:QQMessageCell_id];
    if (!cell) {
        cell = [[QQMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:QQMessageCell_id];
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
