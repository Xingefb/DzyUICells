//
//  IconNameMessageCell.h
//  DzyUICells
//
//  Created by Dzy on 06/06/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *IconNameMessageCell_id = @"IconNameMessageCell";

@interface IconNameMessageCell : UITableViewCell

@property (nonatomic ) NSDictionary *model;
+ (instancetype)cellForTableVIew:(UITableView *)tableView;

@end
