//
//  CentreTableViewCell.m
//  DataPod
//
//  Created by Fabio General on 1/14/16.
//  Copyright © 2016 Fabio General. All rights reserved.
//

#import "CentreTableViewCell.h"

@implementation CentreTableViewCell

@synthesize thumbImageView = _thumbImageView;
@synthesize retailerName = _retailerName;
@synthesize title = _title;
@synthesize expiresDate = _expiresDate;

#pragma mark - Downloading Image from URL

- (void)setImageURL:(NSURL *)imageURL {
    _imageURL = imageURL;

    [self downloadImage];
}

- (void)downloadImage {
    self.image = nil;
    if (self.imageURL) {
        [self.spinner startAnimating];
        NSURLRequest *request = [NSURLRequest requestWithURL:self.imageURL];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *localfile, NSURLResponse *response, NSError *error) {
            if (!error) {
                if ([request.URL isEqual:self.imageURL]) {
                    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:localfile]];
                    dispatch_async(dispatch_get_main_queue(), ^{ // block
                        self.image = image;
                    });
                }
            }
        }];
        [task resume];
    }
}

- (UIImage *)image {
    return self.thumbImageView.image;
}

- (void)setImage:(UIImage *)image {
    self.thumbImageView.image = image;
    [self.thumbImageView sizeToFit];
    self.thumbImageView.frame = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
    [self.spinner stopAnimating];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
