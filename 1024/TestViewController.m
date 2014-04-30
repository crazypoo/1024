//
//  TestViewController.m
//  1024
//
//  Created by MAC on 14-3-28.
//  Copyright (c) 2014年 MAC. All rights reserved.
//

#import "TestViewController.h"
#import "LuckyLabel.h"


@interface TestViewController ()

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self addBackGround];
    [self initData];
    [self firstBornLabel];
//    [self testBornLabel];
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20 , 60, 70, 100)];
//    label.text = @"2";
//    label.backgroundColor = [UIColor greenColor];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.tintColor = [UIColor blackColor];
//    label.tag = 123;
//    [self.view addSubview:label];
    
//    int r;
//    for (int i = 0; i<=20; i++) {
//        r = arc4random()%5+1;
//        NSLog(@"r = %d",r);
//    }
    
    UISwipeGestureRecognizer *tapGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [tapGesture setNumberOfTouchesRequired:1];
    [tapGesture setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:tapGesture];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [swipe setNumberOfTouchesRequired:1];
    [swipe setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft:)];
    [swipeLeft setNumberOfTouchesRequired:1];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeUp:)];
    [swipeUp setNumberOfTouchesRequired:1];
    [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:swipeUp];
    
   
}

#pragma mark -------- 手勢
- (void)tapGesture:(UISwipeGestureRecognizer *)gestureRecognizer
{
//    NSLog(@"down");
    [self resetGameState];
    [self moveLabel:4];
    if (self.currentExistArray.count < 16 && self.canBornNewLabel) {
        [self bornNewLabel];
    }
    else if (self.currentExistArray.count == 16)
    {
        [self isGameOver];
        NSLog(@"GAME　OVER!");
    }
}

-(void)handleSwipeUp:(UISwipeGestureRecognizer *)gestureRecognizer
{
//    NSLog(@"up");
    [self resetGameState];
    [self moveLabel:3];
    if (self.currentExistArray.count < 16 && self.canBornNewLabel) {
        [self bornNewLabel];
    }
    else if (self.currentExistArray.count == 16)
    {
        [self isGameOver];
        NSLog(@"GAME　OVER!");
    }
}

-(void)handleSwipeLeft:(UISwipeGestureRecognizer *)gestureRecognizer
{
//    NSLog(@"left");
    [self resetGameState];
    [self moveLabel:2];
    if (self.currentExistArray.count < 16 && self.canBornNewLabel) {
        [self bornNewLabel];
    }
    else if (self.currentExistArray.count == 16)
    {
        [self isGameOver];
        NSLog(@"GAME　OVER!");
    }
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)gestureRecognizer
{
//    NSLog(@"right");
    [self resetGameState];
    [self moveLabel:1];
    if (self.currentExistArray.count < 16 && self.canBornNewLabel) {
        [self bornNewLabel];
    }
    else if (self.currentExistArray.count == 16)
    {
        [self isGameOver];
        NSLog(@"GAME　OVER!");
    }
}

-(void)initData
{
    self.emptyPlaceArray =  [NSMutableArray arrayWithObjects:
                             [NSNumber numberWithInt:11],
                             [NSNumber numberWithInt:21],
                             [NSNumber numberWithInt:31],
                             [NSNumber numberWithInt:41],
                             [NSNumber numberWithInt:12],
                             [NSNumber numberWithInt:22],
                             [NSNumber numberWithInt:32],
                             [NSNumber numberWithInt:42],
                             [NSNumber numberWithInt:13],
                             [NSNumber numberWithInt:23],
                             [NSNumber numberWithInt:33],
                             [NSNumber numberWithInt:43],
                             [NSNumber numberWithInt:14],
                             [NSNumber numberWithInt:24],
                             [NSNumber numberWithInt:34],
                             [NSNumber numberWithInt:44],
                             nil];
    
    self.currentExistArray = [NSMutableArray arrayWithCapacity:16];
    self.labelArray = [NSArray arrayWithObjects:
                          [NSNumber numberWithInt:2],
                          [NSNumber numberWithInt:4],
                          nil];
    
    [self resetGameState];

}
-(void)resetGameState
{
    self.canBornNewLabel = NO;
    self.isOver = NO;
    self.R_1 = YES;
    self.R_2 = YES;
    self.R_3 = YES;
    self.R_4 = YES;
    self.C_1 = YES;
    self.C_2 = YES;
    self.C_3 = YES;
    self.C_4 = YES;

}
-(void)testBornLabel
{
    self.testArray =  [NSMutableArray arrayWithObjects:
                             [NSNumber numberWithInt:11],
                             [NSNumber numberWithInt:21],
                             [NSNumber numberWithInt:31],
                             [NSNumber numberWithInt:41],
                             [NSNumber numberWithInt:12],
                             [NSNumber numberWithInt:22],
                             [NSNumber numberWithInt:32],
                             [NSNumber numberWithInt:42],
                             [NSNumber numberWithInt:13],
                             [NSNumber numberWithInt:23],
                             [NSNumber numberWithInt:33],
                             [NSNumber numberWithInt:43],
                             [NSNumber numberWithInt:14],
                             [NSNumber numberWithInt:24],
                             [NSNumber numberWithInt:34],
                             [NSNumber numberWithInt:44],
                             
                             nil];
    LuckyLabel *label = [[LuckyLabel alloc]init];
    label.placeTag = 13;
    label.numberTag = 2;
    label.text = [NSString stringWithFormat:@"%d",label.numberTag];

     NSDictionary *dic =  [self caculatePosition:[NSNumber numberWithInt:label.placeTag]];
    
    CGRect frame =  CGRectMake([[dic objectForKey:kPlaceX] intValue]+1, [[dic objectForKey:kPlaceY] intValue]+1, kOneLabelwidth-2, kOneLabelHeight-2);
    
    label.frame = frame;
    [self.currentExistArray addObject:label];
    [self.view addSubview:label];
    
    for (int i=0; i<15; i++) {
        LuckyLabel *label = [[LuckyLabel alloc]init];
        label.placeTag = [[self.testArray objectAtIndex:i] intValue];
        label.numberTag = 2*(i+1);
        label.text = [NSString stringWithFormat:@"%d",label.numberTag];
        
        NSDictionary *dic =  [self caculatePosition:[NSNumber numberWithInt:label.placeTag]];
        
        CGRect frame =  CGRectMake([[dic objectForKey:kPlaceX] intValue]+1, [[dic objectForKey:kPlaceY] intValue]+1, kOneLabelwidth-2, kOneLabelHeight-2);
        
        label.frame = frame;
        [self.currentExistArray addObject:label];
        [self.view addSubview:label];
        
    }
    
    
    
    LuckyLabel *label2 = [[LuckyLabel alloc]init];
    label2.placeTag = 23;
    label2.numberTag = 2;
    label2.text = [NSString stringWithFormat:@"%d",label2.numberTag];

    NSDictionary *dic2 =  [self caculatePosition:[NSNumber numberWithInt:label2.placeTag]];
//
    CGRect frame2 =  CGRectMake([[dic2 objectForKey:kPlaceX] intValue]+1, [[dic2 objectForKey:kPlaceY] intValue]+1, kOneLabelwidth-2, kOneLabelHeight-2);
//    
    label2.frame = frame2;
    [self.currentExistArray addObject:label2];
    [self.view addSubview:label2];
//
//    
//    
    LuckyLabel *label3 = [[LuckyLabel alloc]init];
    label3.placeTag = 43;
    label3.numberTag = 2;
    label3.text = [NSString stringWithFormat:@"%d",label3.numberTag];

    NSDictionary *dic3 =  [self caculatePosition:[NSNumber numberWithInt:label3.placeTag]];
//
    CGRect frame3 =  CGRectMake([[dic3 objectForKey:kPlaceX] intValue]+1, [[dic3 objectForKey:kPlaceY] intValue]+1, kOneLabelwidth-2, kOneLabelHeight-2);
//
    label3.frame = frame3;
    [self.currentExistArray addObject:label3];
    [self.view addSubview:label3];
    
    
    LuckyLabel *label4 = [[LuckyLabel alloc]init];
    label4.placeTag = 14;
    label4.numberTag = 4;
    label4.text = [NSString stringWithFormat:@"%d",label4.numberTag];
//
    NSDictionary *dic4 =  [self caculatePosition:[NSNumber numberWithInt:label4.placeTag]];
//
    CGRect frame4 =  CGRectMake([[dic4 objectForKey:kPlaceX] intValue]+1, [[dic4 objectForKey:kPlaceY] intValue]+1, kOneLabelwidth-2, kOneLabelHeight-2);
//
    label4.frame = frame4;
    [self.currentExistArray addObject:label4];
    [self.view addSubview:label4];
}

-(void)firstBornLabel
{

    int random;
    for (int i=0; i<2; i++) {
        random = arc4random()%(self.emptyPlaceArray.count-1);
        
        NSNumber *place = [self.emptyPlaceArray objectAtIndex:random];
        [self.emptyPlaceArray removeObject:place];
        LuckyLabel *label = [[LuckyLabel alloc]init];
        label.placeTag = [place intValue];
//        label.backgroundColor = [UIColor greenColor];
//        label.tintColor = [UIColor blackColor];
//        label.textAlignment = NSTextAlignmentCenter;
        NSDictionary *dic =  [self caculatePosition:place];
      
        int random2 = arc4random()%2;
//        label.numberTag = random2;
        NSNumber *textNumber = [self.labelArray objectAtIndex:random2];
        label.numberTag = textNumber.intValue;
        label.text =[NSString stringWithFormat:@"%@",textNumber];
        if ([label.text isEqualToString:@"2"]) {
            label.backgroundColor = [UIColor greenColor];
        }
        else
        {
            label.backgroundColor = [UIColor blueColor];
        }

         CGRect frame =  CGRectMake([[dic objectForKey:kPlaceX] intValue]+1, [[dic objectForKey:kPlaceY] intValue]+1, kOneLabelwidth-2, kOneLabelHeight-2);
        
        label.frame = frame;
//        label.placeTag = [place intValue];
        [self.currentExistArray addObject:label];
        [self.view addSubview:label];
    }

}
-(NSDictionary *)caculatePosition:(NSNumber *)placeNumber
{
    
    int place = [placeNumber intValue];
    int x = 20+kOneLabelwidth/2+kOneLabelwidth*(place/10-1);
    int y = 60+kOneLabelHeight/2+kOneLabelHeight*(place%10-1);
    x = x-kOneLabelwidth/2;
    y = y-kOneLabelHeight/2;
    NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:
    [NSNumber numberWithInt:x],kPlaceX,
    [NSNumber numberWithInt:y],kPlaceY,
    nil];
   
    return dic;
    
}
-(void)bornNewLabel
{
    [self.emptyPlaceArray removeAllObjects];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:11]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:21]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:31]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:41]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:12]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:22]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:32]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:42]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:13]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:23]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:33]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:43]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:14]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:24]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:34]];
    [self.emptyPlaceArray addObject:[NSNumber numberWithInt:44]];
    for (LuckyLabel *label in self.currentExistArray) {
        [self.emptyPlaceArray removeObject:[NSNumber numberWithInt:label.placeTag]];
    }
    int random;
    
    if (self.emptyPlaceArray.count>1) {
      random = arc4random()%(self.emptyPlaceArray.count-1);
    }else 
    {
        random = 0;
    }
    
   
    
  
   
    
    NSNumber *place = [self.emptyPlaceArray objectAtIndex:random];
    LuckyLabel *label = [[LuckyLabel alloc]init];
    label.placeTag = [place intValue];
    NSDictionary *dic =  [self caculatePosition:place];
     int random2 = arc4random()%2;
//    label.numberTag = random2;
    NSNumber *textNumber = [self.labelArray objectAtIndex:random2];
    label.numberTag = textNumber.intValue;
    
    label.text =[NSString stringWithFormat:@"%@",textNumber];
    if ([label.text isEqualToString:@"2"]) {
        label.backgroundColor = [UIColor greenColor];
    }
    else
    {
        label.backgroundColor = [UIColor blueColor];
    }
    
    CGRect frame =  CGRectMake([[dic objectForKey:kPlaceX] intValue]+1, [[dic objectForKey:kPlaceY] intValue]+1, kOneLabelwidth-2, kOneLabelHeight-2);
     label.frame = frame;

    [self.currentExistArray addObject:label];
    [self.view addSubview:label];


}
-(void)setStateFlagDirection:(int)direction andPlace:(int) rORc
{

    if ((direction == kRight ) || (direction == kLeft)) {
        
        switch (rORc) {
            case 1:
                self.R_1 = NO;
                break;
            case 2:
                self.R_2 = NO;
                break;
            case 3:
                self.R_3 = NO;
                break;
            case 4:
                self.R_4 = NO;
                break;
                
            default:
                break;
        }
        
        
    }else if ((direction == kUp ) || (direction == kDown))
    {
        switch (rORc) {
            case 1:
                self.C_1 = NO;
                break;
            case 2:
                self.C_2 = NO;
                break;
            case 3:
                self.C_3 = NO;
                break;
            case 4:
                self.C_4 = NO;
                break;
                
            default:
                break;
        }
        
    
    }



}
-(BOOL)selfStateIsValid:(LuckyLabel *)label andDirection:(int)direction
{
     if ((direction == kRight ) || (direction == kLeft))
     {
         switch (label.placeTag%10) {
             case 1:
                 return self.R_1;
                 break;
             case 2:
                 return self.R_2;
                 break;
             case 3:
                 return self.R_3;
                 break;
             case 4:
                 return self.R_4;
                 break;
             default:
                 break;
         }
     
     }else if ((direction == kUp ) || (direction == kDown))
     {
     
         switch (label.placeTag/10) {
             case 1:
                 return self.C_1;
                 break;
             case 2:
                 return self.C_2;
                 break;
             case 3:
                 return self.C_3;
                 break;
             case 4:
                 return self.C_4;
                 break;
             default:
                 break;
         }
     
     }
   
    return NO;
  
}
-(BOOL)isFrontLabelEmpty:(LuckyLabel *)label andDirection:(int) direction
{
    
    switch (direction) {
        case kRight:
              for (LuckyLabel *childLabel in self.currentExistArray) {
                  
                  if ((label.placeTag+10) == childLabel.placeTag) {
                      return NO;
                  }
              }
            break;
        case kLeft:
            for (LuckyLabel *childLabel in self.currentExistArray) {
                
                if ((label.placeTag-10) == childLabel.placeTag) {
                    return NO;
                }
            }
            break;
        case kUp:
            for (LuckyLabel *childLabel in self.currentExistArray) {
                
                if ((label.placeTag-1) == childLabel.placeTag) {
                    return NO;
                }
            }
            break;
        case kDown:
            for (LuckyLabel *childLabel in self.currentExistArray) {
                
                if ((label.placeTag+1) == childLabel.placeTag) {
                    return NO;
                }
            }
            break;
            
        default:
            break;
    }
 

    return YES;
}
-(void)isGameOver
{
    self.isOver = YES;
    [self moveLabel:1];
    [self moveLabel:2];
    [self moveLabel:3];
    [self moveLabel:4];
    
    if (self.isOver == YES) {
        
      UIAlertView *alertView =  [[UIAlertView alloc]initWithTitle:@"Game Over" message:@"Game Over" delegate:self cancelButtonTitle:@"OH" otherButtonTitles:nil, nil];
        
        [alertView show];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
//        [self.view removeFromSuperview];
//        [self addBackGround];
//        [self initData];
//        [self firstBornLabel];
    }
}

-(int)checkFrontLabel:(LuckyLabel *)label andDirection:(int) direction
{
    switch (direction) {
        case 1: //right
            for (LuckyLabel *childLabel in self.currentExistArray) {
                if ((label.placeTag + 10 == childLabel.placeTag) && (label.numberTag == childLabel.numberTag)) {
                    
                    CGRect frame2 = label.frame;
                    frame2.origin.x += 70;
                    label.placeTag += 10;
                    label.frame = frame2;
                    label.numberTag = label.numberTag*2;
                    label.text = [NSString stringWithFormat:@"%d",label.numberTag];
                    NSLog(@"-------%@",label.text);
                    if ([label.text isEqualToString:@"2"]) {
                        label.backgroundColor = [UIColor greenColor];
                    }
                    else if ([label.text isEqualToString:@"4"])
                    {
                        label.backgroundColor = [UIColor blueColor];
                    }
                    else if ([label.text isEqualToString:@"8"])
                    {
                        label.backgroundColor = [UIColor redColor];
                    }
                    else if ([label.text isEqualToString:@"16"])
                    {
                        label.backgroundColor = [UIColor whiteColor];
                    }
                    else if ([label.text isEqualToString:@"32"])
                    {
                        label.backgroundColor = [UIColor lightGrayColor];
                    }
                    else if ([label.text isEqualToString:@"64"])
                    {
                        label.backgroundColor = [UIColor grayColor];
                    }
                    else if ([label.text isEqualToString:@"128"])
                    {
                        label.backgroundColor = [UIColor brownColor];
                    }
                    
                     [self setStateFlagDirection:1 andPlace:label.placeTag%10];
                    [self.currentExistArray removeObject:childLabel];
                    [childLabel removeFromSuperview];
                    
                    self.canBornNewLabel = YES;
                    self.isOver = NO;
                    return kHaveSameNumberLabel;
                }else if ((label.placeTag + 10 == childLabel.placeTag) && (label.numberTag!=childLabel.numberTag))
                {
                     return kHaveDifferentLabel;
                }
            }

            if ((label.placeTag + 10)/10 == 4) {
                label.placeTag += 10;
                CGRect frame2 = label.frame;
                frame2.origin.x += 70;
                
                label.frame = frame2;
                self.canBornNewLabel =YES;
                return kHaveNoLabel;
            }
            else
            {
                label.placeTag += 10;
                CGRect frame2 = label.frame;
                frame2.origin.x += 70;
                label.frame = frame2;
                self.canBornNewLabel = YES;
                 if ([self selfStateIsValid:label andDirection:2] || [self  isFrontLabelEmpty:label andDirection:1]) {
                    [self checkFrontLabel:label andDirection:1];
                 }
            }
    
        
            break;
        case 2: // left
            for (LuckyLabel *childLabel in self.currentExistArray) {
                if ((label.placeTag - 10 == childLabel.placeTag) && (label.numberTag == childLabel.numberTag)) {
                    
                    CGRect frame2 = label.frame;
                    frame2.origin.x -= 70;
                    label.placeTag -= 10;
                    label.frame = frame2;
                    label.numberTag = label.numberTag*2;
                    label.text = [NSString stringWithFormat:@"%d",label.numberTag];
                    if ([label.text isEqualToString:@"2"]) {
                        label.backgroundColor = [UIColor greenColor];
                    }
                    else if ([label.text isEqualToString:@"4"])
                    {
                        label.backgroundColor = [UIColor blueColor];
                    }
                    else if ([label.text isEqualToString:@"8"])
                    {
                        label.backgroundColor = [UIColor redColor];
                    }
                    else if ([label.text isEqualToString:@"16"])
                    {
                        label.backgroundColor = [UIColor whiteColor];
                    }
                    else if ([label.text isEqualToString:@"32"])
                    {
                        label.backgroundColor = [UIColor lightGrayColor];
                    }
                    else if ([label.text isEqualToString:@"64"])
                    {
                        label.backgroundColor = [UIColor grayColor];
                    }
                    else if ([label.text isEqualToString:@"128"])
                    {
                        label.backgroundColor = [UIColor brownColor];
                    }
                    
                    [self setStateFlagDirection:2 andPlace:label.placeTag%10];
                    [self.currentExistArray removeObject:childLabel];
                    [childLabel removeFromSuperview];
                    self.canBornNewLabel = YES;
                    self.isOver = NO;
                     return kHaveSameNumberLabel;
                }else if ((label.placeTag - 10 == childLabel.placeTag) && (label.numberTag!=childLabel.numberTag))
                {
                    
                    return kHaveDifferentLabel;
                }
            }
            //            label.placeTag += 10;
            if ((label.placeTag - 10)/10 == 1) {
                label.placeTag -= 10;
                CGRect frame2 = label.frame;
                frame2.origin.x -= 70;
                
                label.frame = frame2;
                self.canBornNewLabel = YES;
                return kHaveNoLabel;
            }else
            {
                label.placeTag -= 10;
                CGRect frame2 = label.frame;
                frame2.origin.x -= 70;
                label.frame = frame2;
                self.canBornNewLabel = YES;
                if ([self selfStateIsValid:label andDirection:2]) {
                   [self checkFrontLabel:label andDirection:2];
                }
                
            }
            break;
        case 3: // up
            for (LuckyLabel *childLabel in self.currentExistArray) {
                if ((label.placeTag - 1 == childLabel.placeTag) && (label.numberTag == childLabel.numberTag)) {
                    
                    CGRect frame3 = label.frame;
                    frame3.origin.y -= 100;
                    label.placeTag -= 1;
                    label.frame = frame3;
                    label.numberTag = label.numberTag*2;
                    label.text = [NSString stringWithFormat:@"%d",label.numberTag];
                    if ([label.text isEqualToString:@"2"]) {
                        label.backgroundColor = [UIColor greenColor];
                    }
                    else if ([label.text isEqualToString:@"4"])
                    {
                        label.backgroundColor = [UIColor blueColor];
                    }
                    else if ([label.text isEqualToString:@"8"])
                    {
                        label.backgroundColor = [UIColor redColor];
                    }
                    else if ([label.text isEqualToString:@"16"])
                    {
                        label.backgroundColor = [UIColor whiteColor];
                    }
                    else if ([label.text isEqualToString:@"32"])
                    {
                        label.backgroundColor = [UIColor lightGrayColor];
                    }
                    else if ([label.text isEqualToString:@"64"])
                    {
                        label.backgroundColor = [UIColor grayColor];
                    }
                    else if ([label.text isEqualToString:@"128"])
                    {
                        label.backgroundColor = [UIColor brownColor];
                    }
                    
                    [self setStateFlagDirection:3  andPlace:label.placeTag/10];
                    [self.currentExistArray removeObject:childLabel];
                    [childLabel removeFromSuperview];
                    self.canBornNewLabel = YES;
                    self.isOver = NO;
                    return kHaveSameNumberLabel;

                }else if ((label.placeTag - 1 == childLabel.placeTag) && (label.numberTag!=childLabel.numberTag))
                {
                    return kHaveDifferentLabel;
                }
            }
            if ((label.placeTag - 1)%10 == 1) {
                label.placeTag -= 1;
                CGRect frame3 = label.frame;
                frame3.origin.y -= 100;
                
                label.frame = frame3;
                self.canBornNewLabel = YES;
                return kHaveNoLabel;
            }else
            {
                label.placeTag -= 1;
                CGRect frame3 = label.frame;
                frame3.origin.y -= 100;
                label.frame = frame3;
                self.canBornNewLabel = YES;
                if ([self selfStateIsValid:label andDirection:3]) {
                    [self checkFrontLabel:label andDirection:3];
                }
                
            }

            
            break;
        case 4: // down
            for (LuckyLabel *childLabel in self.currentExistArray) {
                if ((label.placeTag + 1 == childLabel.placeTag) && (label.numberTag == childLabel.numberTag)) {
                    
                    CGRect frame4 = label.frame;
                    frame4.origin.y += 100;
                    label.placeTag += 1;
                    label.frame = frame4;
                    label.numberTag = label.numberTag*2;
                    label.text = [NSString stringWithFormat:@"%d",label.numberTag];
                    if ([label.text isEqualToString:@"2"]) {
                        label.backgroundColor = [UIColor greenColor];
                    }
                    else if ([label.text isEqualToString:@"4"])
                    {
                        label.backgroundColor = [UIColor blueColor];
                    }
                    else if ([label.text isEqualToString:@"8"])
                    {
                        label.backgroundColor = [UIColor redColor];
                    }
                    else if ([label.text isEqualToString:@"16"])
                    {
                        label.backgroundColor = [UIColor whiteColor];
                    }
                    else if ([label.text isEqualToString:@"32"])
                    {
                        label.backgroundColor = [UIColor lightGrayColor];
                    }
                    else if ([label.text isEqualToString:@"64"])
                    {
                        label.backgroundColor = [UIColor grayColor];
                    }
                    else if ([label.text isEqualToString:@"128"])
                    {
                        label.backgroundColor = [UIColor brownColor];
                    }
                    
                    [self setStateFlagDirection:3  andPlace:label.placeTag/10];
                    [self.currentExistArray removeObject:childLabel];
                    [childLabel removeFromSuperview];
                    self.canBornNewLabel = YES;
                    self.isOver = NO;
                    return kHaveSameNumberLabel;
                    
                }else if ((label.placeTag +1 == childLabel.placeTag) && (label.numberTag!=childLabel.numberTag))
                {
                    return kHaveDifferentLabel;
                }
            }
            if ((label.placeTag + 1)%10 == 4) {
                label.placeTag += 1;
                CGRect frame4 = label.frame;
                frame4.origin.y += 100;
                
                label.frame = frame4;
                self.canBornNewLabel = YES;
                return kHaveNoLabel;
            }else
            {
                label.placeTag += 1;
                CGRect frame4 = label.frame;
                frame4.origin.y += 100;
                label.frame = frame4;
                self.canBornNewLabel = YES;
                if ([self selfStateIsValid:label andDirection:4]) {
                    [self checkFrontLabel:label andDirection:4];
                }
                
            }
            
            break;
            
        default:
            break;
    }
 
    return 0;

}


-(void)moveLabel:(int) directionFlag
{
    NSMutableArray *array1 = [[NSMutableArray alloc]initWithCapacity:4];
    NSMutableArray *array2 = [[NSMutableArray alloc]initWithCapacity:4];
    NSMutableArray *array3 = [[NSMutableArray alloc]initWithCapacity:4];
    NSMutableArray *array4 = [[NSMutableArray alloc]initWithCapacity:4];
    
    switch (directionFlag)
    {
        case 1: //right
            for (LuckyLabel *label in self.currentExistArray) {
                switch (label.placeTag/10) {
                    case 4:
                        [array1 addObject:label];
                        break;
                    case 3:
                        [array2 addObject:label];
                        break;
                    case 2:
                        [array3 addObject:label];
                        break;
                    case 1:
                        [array4 addObject:label];
                        break;
                     default:
                        break;
                 }
            }
                for (LuckyLabel *childLabel in array2) {
                    
                   [self checkFrontLabel:childLabel andDirection:1];
                 }
                for (LuckyLabel *childLabel in array3) {

                    [self checkFrontLabel:childLabel andDirection:1];
                }
                for (LuckyLabel *childLabel in array4) {
                     [self checkFrontLabel:childLabel andDirection:1];
                }
            break;
        case 2: //left
            for (LuckyLabel *label in self.currentExistArray) {
                switch (label.placeTag/10) {
                    case 1:
                        [array1 addObject:label];
                        break;
                    case 2:
                        [array2 addObject:label];
                        break;
                    case 3:
                        [array3 addObject:label];
                        break;
                    case 4:
                        [array4 addObject:label];
                        break;
                    default:
                        break;
                }
            }
            for (LuckyLabel *childLabel in array2) {
            [self checkFrontLabel:childLabel andDirection:2];
                
            }
            for (LuckyLabel *childLabel in array3) {
            [self checkFrontLabel:childLabel andDirection:2];
                
            }
            for (LuckyLabel *childLabel in array4) {
            [self checkFrontLabel:childLabel andDirection:2];
                
            }
             break;
        case 3: // up
            for (LuckyLabel *label in self.currentExistArray) {
                switch (label.placeTag%10) {
                    case 1:
                        [array1 addObject:label];
                        break;
                    case 2:
                        [array2 addObject:label];
                        break;
                    case 3:
                        [array3 addObject:label];
                        break;
                    case 4:
                        [array4 addObject:label];
                        break;
                    default:
                        break;
                }
            }
            for (LuckyLabel *childLabel in array2) {
               [self checkFrontLabel:childLabel andDirection:3];
            }
            for (LuckyLabel *childLabel in array3) {
                [self checkFrontLabel:childLabel andDirection:3];
            }
            for (LuckyLabel *childLabel in array4) {
                [self checkFrontLabel:childLabel andDirection:3];
            }
            break;
        case 4: // down
            for (LuckyLabel *label in self.currentExistArray) {
                switch (label.placeTag%10) {
                    case 4:
                        [array1 addObject:label];
                        break;
                    case 3:
                        [array2 addObject:label];
                        break;
                    case 2:
                        [array3 addObject:label];
                        break;
                    case 1:
                        [array4 addObject:label];
                        break;
                    default:
                        break;
                }
            }
            
            for (LuckyLabel *childLabel in array2) {
               [self checkFrontLabel:childLabel andDirection:4];
            }
            for (LuckyLabel *childLabel in array3) {
               [self checkFrontLabel:childLabel andDirection:4];
            }
            for (LuckyLabel *childLabel in array4) {
               [self checkFrontLabel:childLabel andDirection:4];
            }
            break;
        default:
            break;
    }

}

-(void)addBackGround
{

    UIImageView *imageView=[[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIGraphicsBeginImageContext(imageView.frame.size);
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 3.0);
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    
    // 边框
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 20, 60);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 300, 60);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 300, 460);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 20, 460);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 20, 60);
    
    // 竖线
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 90, 60);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 90, 460);
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 160, 60);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 160, 460);
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 230, 60);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 230, 460);
    
     // 横线
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 20, 160);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 300, 160);
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 20, 260);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 300, 260);
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 20, 360);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 300, 360);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
