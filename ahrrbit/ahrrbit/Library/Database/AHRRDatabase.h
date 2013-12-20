//
//  AHRRDatabase.h
//  ahrrbit
//
//  Created by Massimo Oliviero on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void(^AHRRDatabaseEntityBlock) (NSManagedObject *entity, NSError *error);
typedef void(^AHRRDatabaseListBlock) (NSArray *elements, NSError *error);

@interface AHRRDatabase : NSObject

@property (nonatomic, readonly) NSManagedObjectContext *context;

- (instancetype)initWithContext:(NSManagedObjectContext *)context;

- (void)createObject:(Class)enityClass completion:(AHRRDatabaseEntityBlock)completion;
- (void)selectAll:(Class)entityClass completion:(AHRRDatabaseListBlock)completion;

@end
