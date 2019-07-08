//
//  VideoVC.h
//  Tutorials
//
//  Created by macOS on 7/8/19.
//  Copyright © 2019 macOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

NS_ASSUME_NONNULL_BEGIN

@interface VideoVC : UIViewController <UIWebViewDelegate>

@property (nonatomic,strong) Video *video;

@end

NS_ASSUME_NONNULL_END
