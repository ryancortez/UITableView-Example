//
//  TaskTableViewCell.m
//  UITableVIewAssigment
//
//  Created by Ryan Cortez on 6/21/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import "TaskTableViewCell.h"

@implementation TaskTableViewCell

- (IBAction)titleTextField:(id)sender {
    [self.titleTextFieldOutlet becomeFirstResponder];
}

@end
