//
//  CRUTimedTask.h
//  TimeTracker
//
//  Created by patelpra on 7/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRUTimedTask : NSObject

@property (nonatomic, readonly, copy) NSString *client;
@property (nonatomic, readonly, copy) NSString *summary;
@property (nonatomic, readonly) double hourlyRate;
@property (nonatomic, readonly) NSInteger hoursWorked;
@property (nonatomic, readonly) double total;

- (instancetype)initWithClient:(NSString *)aclient
                     summary:(NSString *)summary
                  hourlyRate:(double)hourlyRate
                 hoursWorked:(double)hoursWorked;
@end

NS_ASSUME_NONNULL_END
