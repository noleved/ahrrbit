//
//  AHRRService.h
//  ahrrbit
//
//  Created by Francesco Laruffa on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AHRRConfiguration.h"
#import "AHRRNetwork.h"

typedef void(^AHRRServiceEntityBlock)(id entity, NSError *error);
typedef void(^AHRRServiceListBlock)(NSArray *elements, NSError *error);

@interface AHRRService : NSObject

@property (nonatomic, copy)   NSString *baseUrl;
@property (nonatomic, strong) AHRRNetwork *network;

- (instancetype)initWithBaseUrl:(NSString *)baseUrl modelName:(NSString *)modelName;

- (void)getApplications:(AHRRServiceListBlock)completion;
- (void)addConfiguration:(AHRRConfiguration *)configuration completion:(AHRRServiceEntityBlock)completion;

- (void)fetchRemoteProblems:(AHRRServiceListBlock)completion;

@end
