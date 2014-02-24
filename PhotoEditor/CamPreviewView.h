//
//  CamPreviewView.h
//  PhotoEditor
//
//  Created by Cheriaa Ali on 21/02/14.
//  Copyright (c) 2014 Ali Cheriaa. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AVCaptureSession;

@interface CamPreviewView : UIView
@property (nonatomic) AVCaptureSession *session;
@end
