//
//  HPViewController.m
//  learningcenter
//
//  Created by Gang Cao on 10/25/13.
//  Copyright (c) 2013 Prolific Interactive. All rights reserved.
//

#import "HPViewController.h"
#import <MediaPlayer/MediaPlayer.h>

#define kIdleVideoUrlString @"http://prolificinteractive.com/test/video.mp4"

@interface HPViewController ()
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@end

@implementation HPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupSubviews];
}

#pragma mark - Private Methods

- (void)setupSubviews
{
    // Video view
    
    NSURL *urlString=[NSURL URLWithString:kIdleVideoUrlString];
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:urlString];
    self.moviePlayer.controlStyle = MPMovieControlStyleNone;
    self.moviePlayer.repeatMode = MPMovieRepeatModeOne;
    self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    self.moviePlayer.view.frame = self.view.bounds;
    self.moviePlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.moviePlayer.view];
    
    [self.moviePlayer play];
    
    // Camera button
    
    UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cameraBtn.frame = CGRectMake(0, 0, 200, 60);
    [cameraBtn setTitle:@"Hello Prolific" forState:UIControlStateNormal];
    [cameraBtn addTarget:self action:@selector(bringsUpCamera) forControlEvents:UIControlEventTouchUpInside];
    [cameraBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:20.0f]];
    cameraBtn.center = self.view.center;
    cameraBtn.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:cameraBtn];
}

// TODO: replace this with aurasma cam
- (void)bringsUpCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePickerController.showsCameraControls = YES;
        imagePickerController.delegate = self;
        
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
}

@end
