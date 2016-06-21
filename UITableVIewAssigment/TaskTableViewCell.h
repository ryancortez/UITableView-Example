//
//  TaskTableViewCell.h
//  UITableVIewAssigment
//
//  Created by Ryan Cortez on 6/21/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *titleTextFieldOutlet;
- (IBAction)titleTextField:(id)sender;

@end
