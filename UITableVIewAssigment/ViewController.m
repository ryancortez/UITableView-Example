//
//  ViewController.m
//  UITableVIewAssigment
//
//  Created by Ryan Cortez on 6/21/16.
//  Copyright © 2016 Ryan Cortez. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

#pragma mark - Properties

@property NSMutableArray *tasks;

@end

#pragma mark

@implementation ViewController

#pragma mark - View Lifecycle

- (void) viewDidLoad{
    [super viewDidLoad];
     
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    Task *task1 = [[Task alloc]initWithTitle:@"1.) Put your left foot in"];
    Task *task2 = [[Task alloc]initWithTitle:@"2.) Put your left foot out"];
    Task *task3 = [[Task alloc]initWithTitle:@"3.) Put your left foot in"];
    Task *task4 = [[Task alloc]initWithTitle:@"4.) Shake it all about"];
    
    self.tasks = [[NSMutableArray alloc]initWithArray:@[task1, task2, task3, task4]];
}

#pragma mark - TableView Data Source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    cell.titleTextFieldOutlet.delegate = self;
    Task *task = self.tasks[indexPath.row];
    cell.titleTextFieldOutlet.text = task.title;
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;
}

#pragma mark - TableView Delegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tasks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {

    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Actions

- (IBAction)editButton:(id)sender {
    if (self.tableView.isEditing) {
        [self.tableView setEditing: NO animated: YES];
    } else {
        [self.tableView setEditing: YES animated: YES];
    }
}
- (IBAction)addButton:(id)sender {
    if (!self.tasks) {
        self.tasks = [[NSMutableArray alloc] init];
    }
    [self.tasks insertObject: [[Task alloc]initWithTitle:@"New Task"] atIndex:self.tasks.count];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.tasks.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
