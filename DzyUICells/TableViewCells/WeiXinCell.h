//
//  WeiXinCell.h
//  DzyUICells
//
//  Created by Dzy on 20/06/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *WeiXinCell_id = @"WeiXinCell";

@interface WeiXinCell : UITableViewCell

@property (nonatomic ) NSDictionary *model;
+ (instancetype)cellForTableVIew:(UITableView *)tableView;


@end
