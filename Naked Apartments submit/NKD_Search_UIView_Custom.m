//
//  NKD_Search_UIView_Custom.m
//  Naked Apartments submit
//
//  Created by c on 3/23/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import "NKD_Search_UIView_Custom.h"

@implementation NKD_Search_UIView_Custom


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"IPhone_Search_Scrollview" owner:self options:nil];
    UIView *mainView = [subviewArray objectAtIndex:0];
    [self.view addSubview:mainView];
    [self.view addSubview:self.search_ScrollView];
    self.search_ScrollView.contentSize = CGSizeMake(320, 1000.00);
    self.search_ScrollView.frame = self.view.frame;
    NSLog(@"scrollview content size = %f",self.search_ScrollView.contentSize.height);
    self.search_ScrollView.delegate = self;
    NSLog(@"scrollview frame size %f ",  self.search_ScrollView.frame.size.height);
    self.search_ScrollView.showsVerticalScrollIndicator = YES;
}

@end
