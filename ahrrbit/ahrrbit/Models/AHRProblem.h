//
//  AHRProblem.h
//  ahrrbit
//
//  Created by Andrea Dal Ponte on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AHRApplication;

@interface AHRProblem : NSManagedObject

@property (nonatomic, retain) NSNumber * comments_count;
@property (nonatomic, retain) NSDate * created_at;
@property (nonatomic, retain) NSString * environment;
@property (nonatomic, retain) NSString * error_class;
@property (nonatomic, retain) NSDate * first_notice_at;
@property (nonatomic, retain) NSString * hosts;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSString * issue_link;
@property (nonatomic, retain) NSString * issue_type;
@property (nonatomic, retain) NSDate * last_deploy_at;
@property (nonatomic, retain) NSDate * last_notice_at;
@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSString * messages;
@property (nonatomic, retain) NSNumber * notices_count;
@property (nonatomic, retain) NSNumber * resolved;
@property (nonatomic, retain) NSDate * resolved_at;
@property (nonatomic, retain) NSDate * updated_at;
@property (nonatomic, retain) NSString * user_agents;
@property (nonatomic, retain) NSString * where;
@property (nonatomic, retain) AHRApplication *application;

@end
