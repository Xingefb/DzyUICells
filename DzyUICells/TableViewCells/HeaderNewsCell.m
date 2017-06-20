//
//  HeaderNewsCell.m
//  DzyUICells
//
//  Created by Dzy on 15/06/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//



#import "HeaderNewsCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#define CurrentWidth [UIScreen mainScreen].bounds.size.width

@interface HeaderNewsCell ()

@property (nonatomic ) UIImageView *icon;
@property (nonatomic ) UILabel *title;

@property (nonatomic ) UILabel *state;
@property (nonatomic ) UILabel *time;

@end

@implementation HeaderNewsCell

- (void)setModel:(NSDictionary *)model {
    
    _model = model;
    _title.text = model[@"title"];
    _state.text = model[@"state"];
    _time.text = model[@"time"];
    [_icon sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497949237550&di=1f5542c10a15b4a3d136fa832a2dd6b3&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D3944680232%2C2054173354%26fm%3D214%26gp%3D0.jpg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        CGSize size = image.size;
        NSLog(@"width %f height %f",size.width,size.height);
    }];
    
}

- (void)makeFrame {

    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(self.contentView).offset(10);
        make.width.height.equalTo(@80);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.width.equalTo(@(CurrentWidth - 110));
    }];
    
    [_state mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(_icon.mas_bottom);
    }];
    
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_icon.mas_left).offset(-10);
        make.bottom.equalTo(_icon.mas_bottom);
    }];

}

- (void)createUI {
    
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.state];
    [self.contentView addSubview:self.time];

    [self makeFrame];
    
}

- (UIImageView *)icon {
    
    if (!_icon) {
        UIImageView *icon = [[UIImageView alloc] init];
        icon.backgroundColor = [UIColor orangeColor];
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

- (UILabel *)state {
    
    if (!_state) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor whiteColor];
        l.backgroundColor = [UIColor redColor];
        l.font = [UIFont systemFontOfSize:14];
        _state = l;
    }
    return _state;
}

- (UILabel *)time {
    
    if (!_time) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor grayColor];
        l.font = [UIFont systemFontOfSize:11];
        _time = l;
    }
    return _time;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

+ (instancetype)cellForTableVIew:(UITableView *)tableView {
    
    HeaderNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:HeaderNewsCell_id];
    if (!cell) {
        cell = [[HeaderNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HeaderNewsCell_id];
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
