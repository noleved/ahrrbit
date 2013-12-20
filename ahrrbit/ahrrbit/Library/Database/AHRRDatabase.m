//
//  AHRRDatabase.m
//  ahrrbit
//
//  Created by Massimo Oliviero on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import "AHRRDatabase.h"

@interface AHRRDatabase()

@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation AHRRDatabase

- (instancetype)initWithContext:(NSManagedObjectContext *)context
{
    self = [super init];
    if (self)
    {
        self.context = context;
    }
    
    return self;
}

- (void)selectAll:(Class)entityClass completion:(AHRRDatabaseListBlock)completion
{
    __weak typeof(self) weakSelf = self;
    
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^
    {
        NSString *entityName = NSStringFromClass(entityClass);
        NSFetchRequest *fetch = [[NSFetchRequest alloc] initWithEntityName:entityName];
        
        [weakSelf.context performBlock:^
        {
            NSError *error = nil;
            NSArray *result = [weakSelf.context executeFetchRequest:fetch error:&error];
            
            if (completion)
            {
                completion(result, error);
            }
        }];
    }];
    
    [op start];
}

@end
