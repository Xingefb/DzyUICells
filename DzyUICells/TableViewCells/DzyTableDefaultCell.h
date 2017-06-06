//
//  DzyTableDefaultCell.h
//  DzyUICells
//
//  Created by Dzy on 09/05/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *DzyTableDefaultCell_id = @"DzyTableDefaultCell";

@interface DzyTableDefaultCell : UITableViewCell

@property (nonatomic ) NSDictionary *model;
+ (instancetype)cellForTableVIew:(UITableView *)tableView;

@end
