//
//  ViewController.m
//  DzyUICells
//
//  Created by Dzy on 09/05/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "ViewController.h"

#import "DzyTableViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ) NSMutableArray *data;

@property (nonatomic ) ASButtonNode *btn;

@property (nonatomic ) ASNetworkImageNode *imageNode;

@end

@implementation ViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.section) {
        DzyTableViewController *viewController = [[DzyTableViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }else {

    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    NSArray *data = [_data objectAtIndex:section];
    return data.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cell_id = @"dzy_cell_id";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
    NSArray *data = [_data objectAtIndex:indexPath.section];
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (void)toClickBtn {

    NSLog(@"click btn node");

}

- (ASButtonNode *)btn {

    if (!_btn) {
        ASButtonNode *btn = [[ASButtonNode alloc] init];
        [btn setTitle:@"test node button" withFont:[UIFont systemFontOfSize:14] withColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(toClickBtn) forControlEvents:ASControlNodeEventTouchUpInside];
        _btn = btn;
    }
    return _btn;
    
}

//ASStackLayoutDirection

- (ASNetworkImageNode *)imageNode {

    if (!_imageNode) {
        
        ASNetworkImageNode *img = [[ASNetworkImageNode alloc] init];
        img.URL = [NSURL URLWithString:@""];
        _imageNode = img;
        
    }
    return _imageNode;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _data = [NSMutableArray arrayWithCapacity:10];
    
    NSArray *collection_cells = @[@"DzyCollectionDefaultCell"];
    NSArray *table_cells = @[@"DzyTableDefaultCell"];

    [_data addObject:collection_cells];
    [_data addObject:table_cells];

    [_tableView reloadData];
    
//    [self.view addSubnode:self.btn];
//
//    [_btn.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(100);
//        make.centerX.equalTo(self.view);
//        make.width.equalTo(@40);
//        make.height.equalTo(@40);
//    }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
