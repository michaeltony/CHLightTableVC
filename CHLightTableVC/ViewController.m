//
//  ViewController.m
//  viewControllerTest
//
//  Created by ChenHao on 1/6/15.
//  Copyright (c) 2015 xxTeam. All rights reserved.
//

#import "ViewController.h"
#import "ArrayDataSource.h"


@interface ViewController ()

@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) ArrayDataSource *photosArrayDataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    TableViewCellConfigureBlock configureCell = ^(UITableViewCell *cell, NSString *photo) {
        cell.textLabel.text=photo;
    };
    NSArray *item1= @[@"sasewrwer",@"f22f",@"fff"];
    NSArray *item2=@[@"sas",@"ff",@"gfdfsd"];
    NSArray *item= @[item1,item2];
    
    _photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:item
                                                       multipleItem:YES
                                                    cellIdentifier:@"cell"
                                                configureCellBlock:configureCell];
    self.tableView.dataSource = _photosArrayDataSource;
    self.tableView.delegate=_photosArrayDataSource;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}


@end
