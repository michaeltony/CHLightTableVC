//
//  ArrayDataSource.h
//  viewControllerTest
//
//  Created by ChenHao on 1/6/15.
//  Copyright (c) 2015 xxTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);
typedef void (^TableViewCellHeightConfigureBlock)(NSIndexPath *index, CGFloat height);


@interface ArrayDataSource : NSObject <UITableViewDataSource,UITableViewDelegate>


/**
 *  初始化表格方法 
 *  根据数据源自动计算出数量，支持二位数组
 *  使用二维数组的时候，将multipleItem值设为YES即可完成数据的输入
 *
 *  @param anItems             数据源
 *  @param aCellIdentifier     cell标示符
 *  @param aConfigureCellBlock 配置cell方法的block回调方法
 *
 *  @return id
 */
- (id)initWithItems:(NSArray *)anItems
       multipleItem:(BOOL)multipleItem
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;




- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
@end
