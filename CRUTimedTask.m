//
//  CRUTimedTask.m
//  TimeTracker
//
//  Created by patelpra on 7/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "CRUTimedTask.h"

@implementation CRUTimedTask

- (instancetype)initWithClient:(NSString *)aclient
                     summary:(NSString *)summary
                  hourlyRate:(double)hourlyRate
                 hoursWorked:(double)hoursWorked
                       
{
    if (self = [super init]) {
        _client = aclient.copy;
        _summary = summary.copy;
        _hourlyRate = hourlyRate;
        _hoursWorked = hoursWorked;
        
    }
    return self;
}

- (double)total
{
    return _hourlyRate * _hoursWorked;
}

@end
