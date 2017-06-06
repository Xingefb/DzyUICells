//
//  NewsCell.h
//  DzyUICells
//
//  Created by Dzy on 06/06/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *NewsCell_id = @"NewsCell";

@interface NewsCell : UITableViewCell

@property (nonatomic ) NSDictionary *model;
+ (instancetype)cellForTableVIew:(UITableView *)tableView;

@end
