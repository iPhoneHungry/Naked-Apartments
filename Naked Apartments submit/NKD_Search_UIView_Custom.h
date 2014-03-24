//
//  NKD_Search_UIView_Custom.h
//  Naked Apartments submit
//
//  Created by c on 3/23/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKD_Search_UIView_Custom : UIViewController <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *search_ScrollView;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIButton *outDoorSpace_Button;
@property (weak, nonatomic) IBOutlet UIButton *laundryRoom_Button;
@property (weak, nonatomic) IBOutlet UIButton *inUnit_LaundryRoom_Button;
@property (weak, nonatomic) IBOutlet UIButton *gym_Button;
@property (weak, nonatomic) IBOutlet UIButton *garage_Button;
@property (weak, nonatomic) IBOutlet UIButton *no_Fee_Button;
@property (weak, nonatomic) IBOutlet UIButton *furnished_Button;
@property (weak, nonatomic) IBOutlet UIButton *elevator_Button;
@property (weak, nonatomic) IBOutlet UIButton *doorMan_Button;
@property (weak, nonatomic) IBOutlet UIButton *dishwasher_Button;
@property (weak, nonatomic) IBOutlet UIButton *balcony_Button;
@property (weak, nonatomic) IBOutlet UIButton *verified_Button;
@property (weak, nonatomic) IBOutlet UIButton *cats_Ok_Button;
@property (weak, nonatomic) IBOutlet UIButton *dogs_Ok_Button;
@property (weak, nonatomic) IBOutlet UITextField *maxRent_textField;
@property (weak, nonatomic) IBOutlet UITextField *minRent_textField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *amnt_Of_Rooms_Selectioin;

@end
