//
//  ViewController.h
//  UITableVIewAssigment
//
//  Created by Ryan Cortez on 6/21/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskTableViewCell.h"
#import "Task.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

