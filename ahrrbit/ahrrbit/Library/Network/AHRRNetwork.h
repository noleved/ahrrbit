//
//  AHRRNetwork.h
//  ahrrbit
//
//  Created by Massimo Oliviero on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AHRRProblem.h"

typedef void(^RKDNetworkingProblemsBlock)(NSArray *elements, NSError *error);

@interface AHRRNetwork : NSObject

@property (nonatomic, copy) NSString *baseUrl;
@property (nonatomic, strong) NSManagedObjectContext *context;

- (instancetype)initWithUrl:(NSString*)url;
- (void)problems:(RKDNetworkingProblemsBlock)completion;

@end
