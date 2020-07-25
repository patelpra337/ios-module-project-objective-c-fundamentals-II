//
//  CRUTimedTaskController.h
//  TimeTracker
//
//  Created by patelpra on 7/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CRUTimedTask;

NS_ASSUME_NONNULL_BEGIN

@interface CRUTimedTaskController : NSObject

@property (nonatomic, readonly, copy) NSMutableArray<CRUTimedTask *> *timedTasks;

- (void)createTimedTaskWithClient:(NSString *)client
                          summary:(NSString *)summary
                       hourlyRate:(double)hourlyRate
                      hoursWorked:(double)hoursWorked;

@end

NS_ASSUME_NONNULL_END
