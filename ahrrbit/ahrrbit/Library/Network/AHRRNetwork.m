//
//  AHRRNetwork.m
//  ahrrbit
//
//  Created by Massimo Oliviero on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import "AHRRNetwork.h"
#import "AHRRProblem.h"
#import "AHRRApplication.h"

#import <RestKit/RestKit.h>
#import <RestKit/CoreData.h>

@implementation AHRRNetwork

- (instancetype)initWithUrl:(NSString *)url
{
    if (self = [super init]) {
        self.baseUrl = url;
        [self setupRestKit];
        [self setupMapping];
    }
    return self;
}

# pragma mark - Setup Methods

- (void)setupRestKit
{
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelDefault)
    RKLogConfigureByName("RestKit/Network", RKLogLevelDefault);

    // Object magager
    RKObjectManager* objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:self.baseUrl]];
    
    // Request Format
    [RKObjectManager sharedManager].requestSerializationMIMEType = RKMIMETypeFormURLEncoded;
    
    
    
    NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ahrrbit" ofType:@"momd"]];
    
    
    // NOTE: Due to an iOS 5 bug, the managed object model returned is immutable.
    NSManagedObjectModel *managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
    RKManagedObjectStore *managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    
    [RKManagedObjectStore setDefaultStore:managedObjectStore];
    
    // Initialize the Core Data stack
    [managedObjectStore createPersistentStoreCoordinator];
    
    NSError *error = nil;
    NSString *path = [RKApplicationDataDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite", @"ahrrbit"]];
    
    [managedObjectStore addSQLitePersistentStoreAtPath:path fromSeedDatabaseAtPath:nil withConfiguration:nil options:nil error:&error];
    [managedObjectStore createManagedObjectContexts];
    
    
    // Set the default store shared instance
    objectManager.managedObjectStore = managedObjectStore;
    
    
    // Configure a managed object cache to ensure we do not create duplicate objects
    objectManager.managedObjectStore.managedObjectCache = [[RKInMemoryManagedObjectCache alloc] initWithManagedObjectContext:managedObjectStore.persistentStoreManagedObjectContext];
    
    [objectManager.HTTPClient setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
    {
        if (status == AFNetworkReachabilityStatusNotReachable)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"RECHABILITY_ERROR_TITLE", nil)
                                                            message:NSLocalizedString(@"RECHABILITY_ERROR_MESSAGE", nil)
                                                           delegate:nil
                                                  cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }];
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    self.context =  objectManager.managedObjectStore.mainQueueManagedObjectContext;
}

// deep magic start here:

- (void)setupMapping
{
    RKObjectManager *manager = [RKObjectManager sharedManager];
    
    
//    NSString *token = [NSString stringWithFormat:@"Token token=%@", @"secret_token..."];
//    [manager.HTTPClient setDefaultHeader:@"HTTP_AUTHORIZATION" value:token];
    
    RKEntityMapping *appMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([AHRRApplication class])  inManagedObjectStore:manager.managedObjectStore];
    [appMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"app_name"   toKeyPath:@"app_name"]];
    [appMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"app_id"   toKeyPath:@"app_id"]];
   [appMapping setIdentificationAttributes:@[ @"app_id" ]];
    
    // Mapping Resource Problem
    RKEntityMapping *problemMapping = [RKEntityMapping mappingForEntityForName:NSStringFromClass([AHRRProblem class]) inManagedObjectStore:manager.managedObjectStore];
    
    [problemMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:nil toKeyPath:@"application" withMapping:appMapping]];
    
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"comments_count"   toKeyPath:@"comments_count"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"created_at"       toKeyPath:@"created_at"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"environment"      toKeyPath:@"environment"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"error_class"      toKeyPath:@"error_class"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"first_notice_at"  toKeyPath:@"first_notice_at"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"hosts"            toKeyPath:@"hosts"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"_id"              toKeyPath:@"identifier"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"issue_link"       toKeyPath:@"issue_link"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"issue_type"       toKeyPath:@"issue_type"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"last_deploy_at"   toKeyPath:@"last_deploy_at"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"last_notice_at"   toKeyPath:@"last_notice_at"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"message"          toKeyPath:@"message"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"messages"         toKeyPath:@"messages"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"notices_count"    toKeyPath:@"notices_count"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"resolved"         toKeyPath:@"resolved"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"resolved_at"      toKeyPath:@"resolved_at"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"updated_at"       toKeyPath:@"updated_at"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"user_agents"      toKeyPath:@"user_agents"]];
    [problemMapping addPropertyMapping:[RKAttributeMapping attributeMappingFromKeyPath:@"where"            toKeyPath:@"where"]];
    [problemMapping setIdentificationAttributes:@[ @"identifier" ]];

    // Mapping Responce Problem
    RKResponseDescriptor *problemsResponse = [RKResponseDescriptor responseDescriptorWithMapping:problemMapping
                                                                                          method:RKRequestMethodGET
                                                                                     pathPattern:@"problems"
                                                                                         keyPath:nil
                                                                                     statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [manager addResponseDescriptor:problemsResponse];
    
    
}

# pragma mark - API Methods

- (void)problems:(RKDNetworkingProblemsBlock)completion
{
    
    NSDictionary *queryParams = [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"6ioP9R9tzX2hafks5ghf", @"auth_token", nil];
    
    [[RKObjectManager sharedManager] getObjectsAtPath:@"problems" parameters:queryParams success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult)
    {
        completion(mappingResult.array, nil);
    }
    failure:^(RKObjectRequestOperation *operation, NSError *error)
    {
        completion(nil, error);
    }];
}


@end
