//
//  ArrayDataSource.m
//  viewControllerTest
//
//  Created by ChenHao on 1/6/15.
//  Copyright (c) 2015 xxTeam. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource()

@property (nonatomic, strong) NSArray                     *items;
@property (nonatomic, copy  ) NSString                    *cellIdentifier;
@property (nonatomic, assign) BOOL                        isMultiple;
@property (nonatomic, copy  ) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy  ) TableViewCellHeightConfigureBlock configureHeightCellBlock;
@end


@implementation ArrayDataSource

- (id)initWithItems:(NSArray *)anItems
       multipleItem:(BOOL)multipleItem
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self) {
        _items = anItems;
        _cellIdentifier = aCellIdentifier;
        _configureCellBlock = [aConfigureCellBlock copy];
        _isMultiple=multipleItem;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return [_items objectAtIndex:indexPath.row];
}


- (NSInteger)tableView:(UITableView*)tableView
 numberOfRowsInSection:(NSInteger)section {
    if(_isMultiple)
    {
        return [[_items objectAtIndex:section] count];
    }
    else
    {
        return [_items count];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_isMultiple) {
        return [_items count];
    }
    else
    {
        return 1;
    }
}



- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath {
    id cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier
                                              forIndexPath:indexPath];
    if (_isMultiple) {
        NSArray *Sectionitem = [_items objectAtIndex:indexPath.section];
        self.configureCellBlock(cell, [Sectionitem objectAtIndex:indexPath.row]);
        //self.configureCellBlock(cell, @"fdgdf");
    }
    else
    {
        id item = [self itemAtIndexPath:indexPath];
        self.configureCellBlock(cell, item);
    }
    
    return cell;
}


@end
