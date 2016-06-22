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

// Holds all Tasks for the App
@property NSMutableArray *tasks;

@end

#pragma mark

@implementation ViewController

#pragma mark - View Lifecycle

- (void) viewDidLoad{
    [super viewDidLoad];
    
    // Create a hard coded set of Tasks
    Task *task1 = [[Task alloc]initWithTitle:@"1.) Put your left foot in"];
    Task *task2 = [[Task alloc]initWithTitle:@"2.) Put your left foot out"];
    Task *task3 = [[Task alloc]initWithTitle:@"3.) Put your left foot in"];
    Task *task4 = [[Task alloc]initWithTitle:@"4.) Shake it all about"];
    self.tasks = [[NSMutableArray alloc]initWithArray:@[task1, task2, task3, task4]];
}

#pragma mark - TableView Data Source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    
    // Set the delegate to the text field as the current ViewController
    cell.titleTextFieldOutlet.delegate = self;
    
    // Place the Task title in the TableView Cell
    Task *task = self.tasks[indexPath.row];
    cell.titleTextFieldOutlet.text = task.title;
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

// Create rows to match the amount of Tasks provided
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;
}

#pragma mark - TableView Delegate

// All rows can be edited
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // When a cell is deleted
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tasks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    // When a cell is inserted
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    // When the return button is hit, make the keyboard disappear
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Actions

- (IBAction)editButton:(id)sender {
    
    // When the Edit butt is hit, toggle the editing mode
    if (self.tableView.isEditing) {
        [self.tableView setEditing: NO animated: YES];
    } else {
        [self.tableView setEditing: YES animated: YES];
    }
}
- (IBAction)addButton:(id)sender {
    
    // Create a list of Tasks if it does not exist
    if (!self.tasks) {
        self.tasks = [[NSMutableArray alloc] init];
    }
    
    // Create a cell and place a Task in it at the end of the TableView
    [self.tasks insertObject: [[Task alloc]initWithTitle:@"New Task"] atIndex:self.tasks.count];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.tasks.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
