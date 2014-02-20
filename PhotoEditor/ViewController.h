//
//  ViewController.h
//  PhotoEditor
//
//  Created by Cheriaa Ali on 20/02/14.
//  Copyright (c) 2014 Ali Cheriaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UIActionSheetDelegate,UINavigationControllerDelegate>



@property (strong, nonatomic) IBOutlet UIImageView *mainImage;
@property (strong, nonatomic) IBOutlet UIImageView *normalFilter;
@property (strong, nonatomic) IBOutlet UIImageView *sepiaFilter;
@property (strong, nonatomic) IBOutlet UIImageView *bnwFilter;
@property (strong, nonatomic) IBOutlet UIImageView *fadeFilter;
@property (strong, nonatomic) IBOutlet UIImageView *intantFilter;
@property (strong, nonatomic) UIImagePickerController *imgPicker;
- (IBAction)changeToNormal:(id)sender;

- (IBAction)changeToSepia;
- (IBAction)changeToBlackAndWhite;
- (IBAction)changeToFade;
- (IBAction)changeToInstant;

- (IBAction)EditNewImage;

@end
