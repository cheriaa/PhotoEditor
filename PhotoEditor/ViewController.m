//
//  ViewController.m
//  PhotoEditor
//
//  Created by Cheriaa Ali on 20/02/14.
//  Copyright (c) 2014 Ali Cheriaa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imgPicker, normalFilter, sepiaFilter, bnwFilter, fadeFilter,intantFilter, mainImage;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self sampleSepia:sepiaFilter];
    [self sampleBlackAndWhite:bnwFilter];
    [self sampleFade:fadeFilter];
    [self sampleInstant:intantFilter];
    
}

-(BOOL) shouldAutorotate
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sampleSepia:(UIImageView *) sepia
{
    CIImage *natureImage = [[CIImage alloc] initWithCGImage:sepia.image.CGImage options:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"
                                  keysAndValues: kCIInputImageKey, natureImage,
                        @"inputIntensity", @0.8, nil];
    CIImage *outputImage = [filter outputImage];

    UIImage *newImage = [UIImage imageWithCIImage:outputImage];
    sepia.image = newImage;
}

-(void)sampleBlackAndWhite :(UIImageView *) bnw{
    CIImage *natureImage = [[CIImage alloc] initWithCGImage:bnw.image.CGImage options:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectNoir"
                                  keysAndValues: kCIInputImageKey, natureImage,nil];
    CIImage *outputImage = [filter outputImage];
    
    UIImage *newImage = [UIImage imageWithCIImage:outputImage];
    bnw.image = newImage;
}
-(void)sampleFade:(UIImageView *) fade{
    
    CIImage *natureImage = [[CIImage alloc] initWithCGImage:fade.image.CGImage options:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectFade"
                                  keysAndValues: kCIInputImageKey, natureImage, nil];
    CIImage *outputImage = [filter outputImage];
    
    UIImage *newImage = [UIImage imageWithCIImage:outputImage];
    fade.image = newImage;
}
-(void)sampleInstant:(UIImageView *) instant{
    CIImage *natureImage = [[CIImage alloc] initWithCGImage:instant.image.CGImage options:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectInstant"
                                  keysAndValues: kCIInputImageKey, natureImage, nil];
    CIImage *outputImage = [filter outputImage];
    
    UIImage *newImage = [UIImage imageWithCIImage:outputImage];
    instant.image = newImage;
    
}

- (IBAction)changeToNormal:(id)sender {
    mainImage.image = [UIImage imageNamed:@"Nature.jpg"];
}

- (IBAction)changeToSepia {
    [self sampleSepia:mainImage];
}

- (IBAction)changeToBlackAndWhite {
    [self sampleBlackAndWhite:mainImage];
}

- (IBAction)changeToFade {
    [self sampleFade:mainImage];
}

- (IBAction)changeToInstant {
    [self sampleInstant:mainImage];
}


- (IBAction)EditNewImage
{
    UIActionSheet *as = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Select from library",@"Take a new photo", nil];
    [as showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.allowsEditing = YES;
    imgPicker.delegate = self;
    if (buttonIndex == 0) {
        imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imgPicker animated:YES completion:nil];
    }
    else if(buttonIndex == 1){
        imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.imgPicker animated:YES completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)imgPicker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    self.mainImage.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
