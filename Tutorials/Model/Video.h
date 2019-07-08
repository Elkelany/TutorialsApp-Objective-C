//
//  Video.h
//  Tutorials
//
//  Created by macOS on 7/8/19.
//  Copyright © 2019 macOS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Video : NSObject

@property (nonatomic, strong) NSString * videoTitle;
@property (nonatomic, strong) NSString * videoDescription;
@property (nonatomic, strong) NSString * videoIframe;
@property (nonatomic, strong) NSString * thumbnailURL;

@end

NS_ASSUME_NONNULL_END
