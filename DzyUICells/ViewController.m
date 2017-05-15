//
//  ViewController.m
//  DzyUICells
//
//  Created by Dzy on 09/05/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "ViewController.h"

#import "DzyTableViewController.h"

@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ) NSMutableArray *data;

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


- (void)viewDidLoad {
    [super viewDidLoad];

    _data = [NSMutableArray arrayWithCapacity:10];
    
    NSArray *collection_cells = @[@"DzyCollectionDefaultCell"];
    NSArray *table_cells = @[@"DzyTableDefaultCell"];

    [_data addObject:collection_cells];
    [_data addObject:table_cells];

    [_tableView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
