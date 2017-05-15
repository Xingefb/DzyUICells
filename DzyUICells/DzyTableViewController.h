//
//  DzyTableViewController.h
//  DzyUICells
//
//  Created by Dzy on 15/05/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TableStyle)
{
    DzyDefaultStyle = 0,
    DzyIconTextStyle
};


@interface DzyTableViewController : UIViewController

@property (nonatomic ) TableStyle style;

@end
