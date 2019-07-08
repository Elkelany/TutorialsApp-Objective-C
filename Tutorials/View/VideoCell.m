//
//  VideoCell.m
//  Tutorials
//
//  Created by macOS on 7/8/19.
//  Copyright © 2019 macOS. All rights reserved.
//

#import "VideoCell.h"

@interface VideoCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *DescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (weak, nonatomic) IBOutlet UIView *cellContainerView;

@end

@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor colorWithRed:157/255 green:157/255 blue:157/255 alpha:0.8].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
}

- (void) updateUI:(nonnull Video *)video {
    self.titleLabel.text = video.videoTitle;
    self.DescriptionLabel.text = video.videoDescription;
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumbnailURL]]];
    self.thumbnailImage.image = image;
}

@end
