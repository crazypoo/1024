//
//  TestViewController.h
//  1024
//
//  Created by MAC on 14-3-28.
//  Copyright (c) 2014年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kOneLabelwidth 70
#define kOneLabelHeight 100
#define kPlaceX @"X"
#define kPlaceY @"Y"
#define kHaveSameNumberLabel 10
#define kHaveNoLabel 20
#define kHaveDifferentLabel 30

#define kRight 1
#define kLeft 2
#define kUp 3
#define kDown 4
    


@interface TestViewController : UIViewController

@property(nonatomic,retain)NSMutableArray *currentExistArray;
@property(nonatomic,retain)NSMutableArray *emptyPlaceArray;
@property(nonatomic,retain)NSArray *labelArray;
@property(nonatomic,retain)NSArray *testArray;

@property(nonatomic)BOOL  R_1;
@property(nonatomic)BOOL  R_2;
@property(nonatomic)BOOL  R_3;
@property(nonatomic)BOOL  R_4;

@property(nonatomic)BOOL  C_1;
@property(nonatomic)BOOL  C_2;
@property(nonatomic)BOOL  C_3;
@property(nonatomic)BOOL  C_4;

@property(nonatomic)BOOL canBornNewLabel;
@property(nonatomic)BOOL isOver;


@end
