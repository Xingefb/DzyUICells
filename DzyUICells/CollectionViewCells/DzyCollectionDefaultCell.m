//
//  DzyCollectionDefaultCell.m
//  DzyUICells
//
//  Created by Dzy on 09/05/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "DzyCollectionDefaultCell.h"
#import <Masonry/Masonry.h>

@implementation DzyCollectionDefaultCell

- (void)makeFrame {


}

- (void)createUI {
   
    
    [self makeFrame];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

@end
