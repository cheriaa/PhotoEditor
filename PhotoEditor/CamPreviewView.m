//
//  CamPreviewView.m
//  PhotoEditor
//
//  Created by Cheriaa Ali on 21/02/14.
//  Copyright (c) 2014 Ali Cheriaa. All rights reserved.
//

#import "CamPreviewView.h"
#import <AVFoundation/AVFoundation.h>

@implementation CamPreviewView
+ (Class)layerClass
{
	return [AVCaptureVideoPreviewLayer class];
}

- (AVCaptureSession *)session
{
	return [(AVCaptureVideoPreviewLayer *)[self layer] session];
}

- (void)setSession:(AVCaptureSession *)session
{
	[(AVCaptureVideoPreviewLayer *)[self layer] setSession:session];
}

@end


