//
//  DzyTableDefaultCell.m
//  DzyUICells
//
//  Created by Dzy on 09/05/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "DzyTableDefaultCell.h"
#import <Masonry/Masonry.h>

@implementation DzyTableDefaultCell


- (void)makeFrame {
    
    
}

- (void)createUI {
    
    
    [self makeFrame];
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
