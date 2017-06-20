//
//  NewsCell.m
//  DzyUICells
//
//  Created by Dzy on 06/06/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "NewsCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#define CurrentWidth [UIScreen mainScreen].bounds.size.width

@interface NewsCell ()
@property (nonatomic ) UIImageView *icon;
@property (nonatomic ) UILabel *title;
@property (nonatomic ) UILabel *message;
@end

@implementation NewsCell

- (void)setModel:(NSDictionary *)model {
    
    _model = model;
    _title.text = model[@"title"];
    _message.text = model[@"message"];
    [_icon sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497952628493&di=9990e60e9f55cc9a6c696684802bd270&imgtype=0&src=http%3A%2F%2Fupload.chinaz.com%2F2015%2F0505%2F1430797029876.png"]];
    
}

- (void)makeFrame {
    
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.width.height.equalTo(@80);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.width.equalTo(@(CurrentWidth - 110));
    }];
    
    [_message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_icon.mas_right).offset(10);
        make.top.equalTo(_title.mas_bottom).offset(5);
        make.width.equalTo(@(CurrentWidth - 120));
        make.bottom.equalTo(_icon.mas_bottom);
    }];
    
}

- (void)createUI {
    
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.message];
    [self makeFrame];
}

- (UIImageView *)icon {
    
    if (!_icon) {
        UIImageView *icon = [[UIImageView alloc] init];
        icon.backgroundColor = [UIColor orangeColor];
        icon.clipsToBounds = YES;
        icon.contentMode = UIViewContentModeScaleAspectFill;
        _icon = icon;
    }
    return _icon;
}

- (UILabel *)title {
    
    if (!_title) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor darkTextColor];
        l.font = [UIFont systemFontOfSize:16];
        l.numberOfLines = 2;
        _title = l;
    }
    return _title;
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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

+ (instancetype)cellForTableVIew:(UITableView *)tableView {
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:NewsCell_id];
    if (!cell) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NewsCell_id];
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
