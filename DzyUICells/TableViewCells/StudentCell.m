//
//  StudentCell.m
//  DzyUICells
//
//  Created by Dzy on 22/06/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "StudentCell.h"

#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIView+XWAddForRoundedCorner.h"
#define CurrentWidth [UIScreen mainScreen].bounds.size.width

@interface StudentCell ()

@property (nonatomic ) UIImageView *icon;
@property (nonatomic ) UILabel *schoolNum;
@property (nonatomic ) UILabel *classNum;
@property (nonatomic ) UILabel *score;

@property (nonatomic ) UILabel *name;
@property (nonatomic ) UILabel *name_class;
@property (nonatomic ) UILabel *email_phone;
@property (nonatomic ) UILabel *money;

@end

@implementation StudentCell

- (void)setModel:(NSDictionary *)model {

    _model = model;
    
    [_icon sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954257052&di=e33d51616d4c6c47076e2e6ae76abf1c&imgtype=0&src=http%3A%2F%2Fimg4.cache.netease.com%2Fgame%2F2015%2F6%2F18%2F201506182245552111c.jpg"]];
    _schoolNum.text = model[@"schoolNum"];
    _classNum.text = model[@"classNum"];
    _score.text = model[@"score"];
    _name.text = model[@"name"];
    _money.text = [NSString stringWithFormat:@"Leave%@",model[@"money"]];
    _name_class.text = model[@"className"];
    _email_phone.text = model[@"email"];

}

- (void)makeFrame {

    // 33 * 48
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        make.width.equalTo(@44);
        make.height.equalTo(@64);
    }];
    
    [_score mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(_icon.mas_top);
    }];
    
    [_schoolNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.centerY.equalTo(_icon);
    }];
    
    [_classNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.equalTo(_icon.mas_bottom);
    }];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).offset(10);
        make.top.equalTo(_icon.mas_top);
    }];
    
    [_name_class mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).offset(10);
        make.centerY.equalTo(_icon);
    }];
    
    [_email_phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).offset(10);
        make.bottom.equalTo(_icon.mas_bottom);
    }];
    
    [_money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name.mas_right).offset(5);
        make.centerY.equalTo(_name);
    }];
    
}

- (void)createUI {
    
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.schoolNum];
    [self.contentView addSubview:self.classNum];
    [self.contentView addSubview:self.score];
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.name_class];
    [self.contentView addSubview:self.email_phone];
    [self.contentView addSubview:self.money];

    [self makeFrame];
}

- (UILabel *)score {
   
    if (!_score) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor darkTextColor];
        l.font = [UIFont systemFontOfSize:16];
        _score = l;
    }
    return _score;
    
}

-(UILabel *)classNum {

    if (!_classNum) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor orangeColor];
        l.font = [UIFont systemFontOfSize:14];
        _classNum = l;
    }
    return _classNum;
}

- (UILabel *)schoolNum {

    if (!_schoolNum) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor redColor];
        l.font = [UIFont systemFontOfSize:14];
        _schoolNum = l;
    }
    return _schoolNum;
    
}

- (UILabel *)money {
    if (!_money) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor blueColor];
        l.font = [UIFont systemFontOfSize:14];
        _money = l;
    }
    return _money;
}

- (UILabel *)email_phone {

    if (!_email_phone) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor darkGrayColor];
        l.font = [UIFont systemFontOfSize:14];
        _email_phone = l;
    }
    return _email_phone;
    
}

- (UILabel *)name_class {
    
    if (!_name_class) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor darkGrayColor];
        l.font = [UIFont systemFontOfSize:14];
        _name_class = l;
    }
    return _name_class;
    
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

- (UIImageView *)icon {
    
    if (!_icon) {
        UIImageView *img = [[UIImageView alloc] init];
        img.clipsToBounds = YES;
        img.contentMode = UIViewContentModeScaleAspectFill;
        _icon = img;
    }
    return _icon;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

+ (instancetype)cellForTableVIew:(UITableView *)tableView {
    
    StudentCell *cell = [tableView dequeueReusableCellWithIdentifier:StudentCell_id];
    if (!cell) {
        cell = [[StudentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:StudentCell_id];
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
