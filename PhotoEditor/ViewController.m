//
//  ViewController.m
//  PhotoEditor
//
//  Created by Cheriaa Ali on 20/02/14.
//  Copyright (c) 2014 Ali Cheriaa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImage * nature;
}



@end

@implementation ViewController
@synthesize imgPicker, normalFilter, sepiaFilter, bnwFilter, fadeFilter,intantFilter, mainImage,image, test;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    nature = [UIImage imageNamed:@"Nature.jpg"];
    [self changeToNormal:nil];
    [self sampleSepia:sepiaFilter image:nature];
    [self sampleBlackAndWhite:bnwFilter image:nature];
    [self sampleFade:fadeFilter image:nature];
    [self sampleInstant:intantFilter image:nature];
    //image = [[self PhotoEditorVC]test];
    NSLog(@"hello baby %@", [self test]);
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

-(void)sampleSepia:(UIImageView *) sepia image: (UIImage*) img
{

    CIImage *natureImage = [[CIImage alloc] initWithCGImage:img.CGImage options:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"
                                  keysAndValues: kCIInputImageKey, natureImage,
                        @"inputIntensity", @0.8, nil];
    CIImage *outputImage = [filter outputImage];

    UIImage *newImage = [UIImage imageWithCIImage:outputImage];
    sepia.image = newImage;
}

-(void)sampleBlackAndWhite :(UIImageView *) bnw  image:(UIImage*) img
{
    
    CIImage *natureImage = [[CIImage alloc] initWithCGImage:img.CGImage options:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectNoir"
                                  keysAndValues: kCIInputImageKey, natureImage,nil];
    CIImage *outputImage = [filter outputImage];
    
    UIImage *newImage = [UIImage imageWithCIImage:outputImage];
    bnw.image = newImage;
}
-(void)sampleFade:(UIImageView *) fade image: (UIImage*) img
{

    
    CIImage *natureImage = [[CIImage alloc] initWithCGImage:img.CGImage options:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectFade"
                                  keysAndValues: kCIInputImageKey, natureImage, nil];
    CIImage *outputImage = [filter outputImage];
    
    UIImage *newImage = [UIImage imageWithCIImage:outputImage];
    fade.image = newImage;
}
-(void)sampleInstant:(UIImageView *) instant image: (UIImage*) img
{

    CIImage *natureImage = [[CIImage alloc] initWithCGImage:img.CGImage options:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectInstant"
                                  keysAndValues: kCIInputImageKey, natureImage, nil];
    CIImage *outputImage = [filter outputImage];
    
    UIImage *newImage = [UIImage imageWithCIImage:outputImage];
    instant.image = newImage;
    
}

- (IBAction)changeToNormal:(id)sender {
    mainImage.image = image;
}

- (IBAction)changeToSepia {
    [self sampleSepia:mainImage image:image];
}

- (IBAction)changeToBlackAndWhite {
    [self sampleBlackAndWhite:mainImage image:image];
}

- (IBAction)changeToFade {
    [self sampleFade:mainImage image:image];
}

- (IBAction)changeToInstant {
    [self sampleInstant:mainImage image:image];
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
    image = [info objectForKey:UIImagePickerControllerEditedImage];
    self.mainImage.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
