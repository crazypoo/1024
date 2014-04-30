//
//  LuckyLabel.m
//  1024
//
//  Created by MAC on 14-3-29.
//  Copyright (c) 2014年 MAC. All rights reserved.
//

#import "LuckyLabel.h"

@implementation LuckyLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor greenColor];
        self.tintColor = [UIColor blackColor];
        self.textAlignment = NSTextAlignmentCenter;

        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
