//
//  PhotoEditorViewController.h
//  PhotoEditor
//
//  Created by Cheriaa Ali on 21/02/14.
//  Copyright (c) 2014 Ali Cheriaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "ViewController.h"
#import "UIImage+Alpha.h"
#import "UIImage+Resize.h"
#import "UIImage+RoundedCorner.h"
@class CamPreviewView;
@class ViewController;
@interface PhotoEditorViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{

}

@property(strong, nonatomic) ViewController *vc;
@property (strong, nonatomic) IBOutlet UIView *cameraView;
@property (strong, nonatomic) UIImagePickerController *imgPicker;
@property (strong, nonatomic) UIImage * image;

@end
