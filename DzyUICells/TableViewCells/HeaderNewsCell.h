//
//  HeaderNewsCell.h
//  DzyUICells
//
//  Created by Dzy on 15/06/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *HeaderNewsCell_id = @"HeaderNewsCell";


@interface HeaderNewsCell : UITableViewCell

@property (nonatomic ) NSDictionary *model;
+ (instancetype)cellForTableVIew:(UITableView *)tableView;


@end
