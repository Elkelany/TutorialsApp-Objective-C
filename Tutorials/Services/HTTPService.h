//
//  HTTPService.h
//  Tutorials
//
//  Created by macOS on 7/7/19.
//  Copyright © 2019 macOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^onComplete)(NSDictionary * __nullable dataArray, NSString * __nullable errMessage);

@interface HTTPService : NSObject

+ (id) instance;
- (void) getTutorials:(nullable onComplete)completionHandler;

@end

NS_ASSUME_NONNULL_END
