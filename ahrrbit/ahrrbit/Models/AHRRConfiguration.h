//
//  AHRRConfiguration.h
//  ahrrbit
//
//  Created by Andrea Dal Ponte on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AHRRApplication;

@interface AHRRConfiguration : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * server;
@property (nonatomic, retain) NSString * token;
@property (nonatomic, retain) NSSet *applications;

@end

@interface AHRRConfiguration (CoreDataGeneratedAccessors)

- (void)addApplicationsObject:(AHRRApplication *)value;
- (void)removeApplicationsObject:(AHRRApplication *)value;
- (void)addApplications:(NSSet *)values;
- (void)removeApplications:(NSSet *)values;

@end
