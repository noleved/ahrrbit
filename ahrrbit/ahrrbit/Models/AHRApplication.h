//
//  AHRApplication.h
//  ahrrbit
//
//  Created by Andrea Dal Ponte on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AHRProblem;

@interface AHRApplication : NSManagedObject

@property (nonatomic, retain) NSString * app_id;
@property (nonatomic, retain) NSString * app_name;
@property (nonatomic, retain) NSManagedObject *configuration;
@property (nonatomic, retain) NSSet *problems;
@end

@interface AHRApplication (CoreDataGeneratedAccessors)

- (void)addProblemsObject:(AHRProblem *)value;
- (void)removeProblemsObject:(AHRProblem *)value;
- (void)addProblems:(NSSet *)values;
- (void)removeProblems:(NSSet *)values;

@end
