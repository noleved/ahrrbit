//
//  AHRRNetwork.h
//  ahrrbit
//
//  Created by Massimo Oliviero on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AHRRNetwork : NSObject

@property (nonatomic, copy) NSString *baseUrl;

- (instancetype)initWithUrl:(NSString*)url;
@end
