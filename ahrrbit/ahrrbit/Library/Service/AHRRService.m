//
//  AHRRService.m
//  ahrrbit
//
//  Created by Francesco Laruffa on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import "AHRRService.h"
#import "AHRRDatabase.h"
#import "AHRRNetwork.h"

@interface AHRRService ()

@property (nonatomic, strong) AHRRDatabase *database;

@end

@implementation AHRRService

# pragma mark - Init methods

- (instancetype)initWithBaseUrl:(NSString *)baseUrl modelName:(NSString *)modelName
{
    if (self = [super init]) {
        self.baseUrl = baseUrl;
        self.network = [[AHRRNetwork alloc] initWithUrl:self.baseUrl];
        self.database = [[AHRRDatabase alloc] initWithContext:self.network.context];
    }
    return self;
}

- (void)sync:(AHRRServiceListBlock)completion
{
    // chiamare restkit
}

- (void)createObject:(Class)objectClass completion:(AHRRServiceEntityBlock)completion
{
    [self.database createObject:objectClass completion:^(NSManagedObject *entity, NSError *error)
    {
        if (completion)
        {
            completion(entity, error);
        }
    }];
}

- (void)getApplications:(AHRRServiceListBlock)completion
{
    [self.database selectAll:nil completion:^(NSArray *elements, NSError *error)
    {
         if (completion)
         {
             completion(elements, error);
         }
    }];
}

- (void)addConfiguration:(AHRRConfiguration *)configuration completion:(AHRRServiceEntityBlock)completion
{
    [self.database saveObject:configuration completion:^(NSManagedObject *entity, NSError *error)
    {
        if (completion)
        {
            completion(entity, error);
        }
    }];
}

# pragma mark - Network methods

- (void)fetchRemoteProblems:(AHRRServiceListBlock)completion;
{
    [self.network problems:^(NSArray *elements, NSError *error) {
        if (completion)
        {
            completion(elements, error);
        }
    }];
}

@end
