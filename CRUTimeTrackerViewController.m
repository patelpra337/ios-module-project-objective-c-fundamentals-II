//
//  CRUTimeTrackerViewController.m
//  TimeTracker
//
//  Created by patelpra on 7/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "CRUTimeTrackerViewController.h"
#import "CRUTimedTaskController.h"
#import "CRUTimedTask.h"

@interface CRUTimeTrackerViewController ()

@property (nonatomic) CRUTimedTaskController *timedTaskController;
@property (nonatomic) NSIndexPath *searchIndexPath;

@property (nonatomic) IBOutlet UITextField *clientTextField;
@property (nonatomic) IBOutlet UITextField *summaryTextField;
@property (nonatomic) IBOutlet UITextField *hourlyRateTextField;
@property (nonatomic) IBOutlet UITextField *timeWorkedTextField;
@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) IBOutlet UIButton *logTimeButton;

@end

@implementation CRUTimeTrackerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timedTaskController = [[CRUTimedTaskController alloc] init];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

- (IBAction)logTime:(id)sender
{
    if (self.searchIndexPath == nil ) {
        [self.timedTaskController createTimedTaskWithClient:self.clientTextField.text
                                                    summary:self.summaryTextField.text
                                                 hourlyRate:self.hourlyRateTextField.text.doubleValue
                                                hoursWorked:self.timeWorkedTextField.text.doubleValue];
    }
    
    [self clearAllTextViews];
    [self.tableView reloadData];
    self.searchIndexPath = nil;
}

- (IBAction)cancelEdit:(id)sender
{
    [UIView setAnimationsEnabled:NO];
    [self.logTimeButton setTitle:@"Log Time" forState:UIControlStateNormal];
    [self.logTimeButton layoutIfNeeded];
    [UIView setAnimationsEnabled:YES];
    
    [self clearAllTextViews];
    [self deselectRow];
}

- (void) clearAllTextViews
{
    self.clientTextField.text = nil;
    self.summaryTextField.text = nil;
    self.hourlyRateTextField.text = nil;
    self.timeWorkedTextField.text = nil;
}

- (void)deselectRow
{
    [self.tableView deselectRowAtIndexPath:self.searchIndexPath animated:NO];
    self.searchIndexPath = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.timedTaskController.timedTasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimedTaskCell" forIndexPath:indexPath];
    
    CRUTimedTask *timedTask = [self.timedTaskController.timedTasks objectAtIndex:indexPath.row];
    
    cell.textLabel.text = timedTask.client;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%.2f", timedTask.total];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CRUTimedTask *timedTask = [self.timedTaskController.timedTasks objectAtIndex:indexPath.row];
    
    self.clientTextField.text = timedTask.client;
    self.summaryTextField.text = timedTask.summary;
    self.hourlyRateTextField.text = [NSString stringWithFormat:@"%g", timedTask.hourlyRate];
    self.timeWorkedTextField.text = [NSString stringWithFormat:@"%ld", (long)timedTask.hoursWorked];
    
    
    [UIView setAnimationsEnabled:NO];
    [self.logTimeButton setTitle:@"Save Changes" forState:UIControlStateNormal];
    [self.logTimeButton layoutIfNeeded];
    [UIView setAnimationsEnabled:YES];
    
    self.searchIndexPath = indexPath;
    
}

@end














