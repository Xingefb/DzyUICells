//
//  QQMessageCell.h
//  DzyUICells
//
//  Created by Dzy on 21/06/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *QQMessageCell_id = @"QQMessageCell";

@interface QQMessageCell : UITableViewCell

@property (nonatomic ) NSDictionary *model;
+ (instancetype)cellForTableVIew:(UITableView *)tableView;


@end
