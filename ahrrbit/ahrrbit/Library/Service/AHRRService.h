//
//  AHRRService.h
//  ahrrbit
//
//  Created by Francesco Laruffa on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AHRRServiceListBlock)(NSArray *elements, NSError *error);

@interface AHRRService : NSObject

@property (nonatomic, copy) NSString *baseUrl;

- (instancetype)initWithBaseUrl:(NSString *)baseUrl modelName:(NSString *)modelName;

- (void)getApplications:(AHRRServiceListBlock)completion;

@end
