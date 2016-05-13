//
//  ViewController.m
//  XDDropDownMenu
//
//  Created by 蔡欣东 on 16/5/2.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "ViewController.h"
#import "XDDropDownMenu.h"
@interface ViewController ()<XDDropDownMenuDataSource,XDDropDownMenuDelegate>{
    NSInteger _select1;
    NSInteger _select2;
    NSInteger _select3;
}
@property(nonnull,copy)NSArray* titles;
@property(nonnull,copy)NSArray* data1;
@property(nonnull,copy)NSArray* data2;
@property(nonnull,copy)NSArray* data3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XDDropDownMenu* menu = [[XDDropDownMenu alloc]initWithOrigin:CGPointMake(0, 40) andHeight:44];
    _titles = @[@"test1",@"test2",@"test3"];
    _data1 = [NSMutableArray arrayWithObjects:@"aaa", @"bbb", @"ccc", @"ddd",@"eee", nil];
    _data2 = [NSMutableArray arrayWithObjects:@"aaa", @"bbb", @"ccc", @"ddd",@"eee", nil];
    _data3 = [NSMutableArray arrayWithObjects:@"aaa", @"bbb", @"ccc", @"ddd",@"eee", nil];
    menu.datasource = self;
    menu.delegate = self;
    [self.view addSubview:menu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(NSInteger)menu:(XDDropDownMenu*)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    if (column==0) {
        if (leftOrRight==0) {
            return _data1.count;
        }else{
            return _data2.count;
        }
        
    } else if (column==1){
        return _data2.count;
    }else if(column==2){
        return _data3.count;
    }
    return 0;
}
- (NSString *)menu:(XDDropDownMenu *)menu titleForRowAtIndexPath:(XDIndexPath *)indexPath{
    if (indexPath.column==0) {
        if (indexPath.leftOrRight==0) {
            return _data1[indexPath.row];
        }else{
            return _data2[indexPath.row];
        }
    }else if(indexPath.column==1){
        return _data2[indexPath.row];
    }else{
        return _data3[indexPath.row];
    }
}
- (NSString *)menu:(XDDropDownMenu *)menu titleForColumn:(NSInteger)column{
    return _titles[column];
}

-(CGFloat)proportionOfWidthInLeftColumn:(NSInteger)column{
    if (column==0) {
        return 0.3;
    }
    return 1;
}

-(BOOL)haveRightTableInColumn:(NSInteger)column{
    if (column==0) {
        return YES;
    }
    return NO;
}


-(NSInteger)currentSelectedRowInLeftTableOfColumn:(NSInteger)column{
    if (column==0) {
        return _select1;
    }else if (column==1){
        return _select2;
    }else if (column==2){
        return _select3;
    }
    return 0;
}

- (NSInteger)numberOfColumnsInMenu:(XDDropDownMenu *)menu{
    return _titles.count;
}

-(void)menu:(XDDropDownMenu *)menu didSelectRowAtIndexPath:(XDIndexPath *)indexPath{
    if (indexPath.column==0) {
        if (indexPath.leftOrRight==0) {
            _select1 = indexPath.row;
        }
        
    }else if(indexPath.column==1){
        _select2 = indexPath.row;
    }else if (indexPath.column==2){
        _select3 = indexPath.row;
    }

}

@end
