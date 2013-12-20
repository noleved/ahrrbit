//
//  AHRRApplication.h
//  ahrrbit
//
//  Created by Andrea Dal Ponte on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AHRRConfiguration, AHRRProblem;

@interface AHRRApplication : NSManagedObject

@property (nonatomic, retain) NSString * app_id;
@property (nonatomic, retain) NSString * app_name;
@property (nonatomic, retain) AHRRConfiguration *configuration;
@property (nonatomic, retain) NSSet *problems;
@end

@interface AHRRApplication (CoreDataGeneratedAccessors)

- (void)addProblemsObject:(AHRRProblem *)value;
- (void)removeProblemsObject:(AHRRProblem *)value;
- (void)addProblems:(NSSet *)values;
- (void)removeProblems:(NSSet *)values;

@end
