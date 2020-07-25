//
//  CRUTimedTaskController.m
//  TimeTracker
//
//  Created by patelpra on 7/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "CRUTimedTaskController.h"
#import "CRUTimedTask.h"

@implementation CRUTimedTaskController

- (instancetype)init
{
    if (self = [super init]) {
        _timedTasks = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createTimedTaskWithClient:(NSString *)client
                          summary:(NSString *)summary
                       hourlyRate:(double)hourlyRate
                      hoursWorked:(double)hoursWorked
{
    CRUTimedTask *newTimedTask = [[CRUTimedTask alloc] initWithClient:client
                                                              summary:summary
                                                           hourlyRate:hourlyRate
                                                          hoursWorked:hoursWorked];
    
    [_timedTasks addObject:newTimedTask];
}
@end
