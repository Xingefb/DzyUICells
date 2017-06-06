//
//  DzyTableDefaultCell.m
//  DzyUICells
//
//  Created by Dzy on 09/05/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "DzyTableDefaultCell.h"
#import <Masonry/Masonry.h>

#define CurrentWidth [UIScreen mainScreen].bounds.size.width

@interface DzyTableDefaultCell ()

@property (nonatomic ) UILabel *title;
@property (nonatomic ) UILabel *message;

@end

@implementation DzyTableDefaultCell

- (void)setModel:(NSDictionary *)model {

    _model = model;
    _title.text = model[@"title"];
    _message.text = model[@"message"];

}

- (void)createUI {
    
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.message];
    
    [self makeFrame];
}

- (void)makeFrame {
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.width.equalTo(@(CurrentWidth - 20));
    }];
    
    [_message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(_title.mas_bottom).offset(10);
        make.width.equalTo(@(CurrentWidth - 20));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
}

- (UILabel *)title {

    if (!_title) {
        UILabel *l = [[UILabel alloc] init];
        l.textColor = [UIColor darkTextColor];
        l.numberOfLines = 2;
        l.font = [UIFont systemFontOfSize:16];
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

    DzyTableDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:DzyTableDefaultCell_id];
    if (!cell) {
        cell = [[DzyTableDefaultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DzyTableDefaultCell_id];
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
