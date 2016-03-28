//
//  BLImageButton.m
//  testProtocol
//
//  Created by Ben Liu on 28/03/2016.
//  Copyright © 2016 Ben Liu. All rights reserved.
//
//  What about it?
//  Be able to let you click on a button which direct your to a link (Web/Email).
//
//  Use:
//  example 1: mailto:arkilis@gmail.com
//  example 2: http://www.arkilis.me
//
//  Objectives:
//  1. able to use URL image
//  2. able to cache the online image
//  3. if the online image is empty, use a default image to replace it.
//  4. if the target url is empty, then do nothing
//  5. able to have the text besides the image

#import "BLImageButton.h"

static NSString* const placeholder=@"placeholder.png";

@implementation BLImageButton

// use the local image as the button
-(void)setLocalImageButton:(NSString*)btnText localImage:(NSString*)local url:(NSString*)url{

    if(url){
        _szTargetUrl= url;
        
        // Create the image in the front. BE CAREFUL, the inner components are using relative position
        /*
        UIImageView *imageView= [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.origin.x+5,
                                                                             self.frame.origin.y+5,
                                                                             self.frame.size.height-10,
                                                                             self.frame.size.height-10)];
         */
        UIImageView *imageView= [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.height-10, self.frame.size.height-10)];
        UIImage *image= [UIImage imageNamed:local];
        if(image){
            imageView.image= image;
        }else{
            imageView.image= [UIImage imageNamed:placeholder];
        }
        
        imageView.contentMode= UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        // Create the text right to the image
        /*
        UILabel *textView= [[UILabel alloc] initWithFrame:CGRectMake(self.frame.origin.x+self.frame.size.height+5,
                                                                       self.frame.origin.y+5,
                                                                       self.frame.size.width-self.frame.size.height,
                                                                        self.frame.size.height-10)];
         */
        UILabel *textView= [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.height+10, 5, self.frame.size.width-self.frame.size.height,self.frame.size.height-10)];
        textView.text= btnText;
        [self addSubview:textView];
        
        self.userInteractionEnabled= YES;
        UITapGestureRecognizer *gesRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToURL)];
        [gesRecognizer setNumberOfTapsRequired:1];
        gesRecognizer.delegate= self;
        [self addGestureRecognizer:gesRecognizer];
    }
}

// use an Internet image button
-(void)setURLImageButton:(NSString*)btnText imageURL:(NSString*)imageURL url:(NSString*)url{
    if(url){
        
        UIImageView *imageView= [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.height-10, self.frame.size.height-10)];
        NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageURL]];
        UIImage *image = [UIImage imageWithData:imageData];
        if(image){
            imageView.image= image;
        }else{
            imageView.image= [UIImage imageNamed:placeholder];
        }
        
        imageView.contentMode= UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        UILabel *textView= [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.height+10, 5, self.frame.size.width-self.frame.size.height,self.frame.size.height-10)];
        textView.text= btnText;
        [self addSubview:textView];
        
        self.backgroundColor= [UIColor redColor];
        self.userInteractionEnabled= YES;
        UITapGestureRecognizer *gesRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToURL)];
        [gesRecognizer setNumberOfTapsRequired:1];
        gesRecognizer.delegate= self;
        [self addGestureRecognizer:gesRecognizer];
        
    }
}

-(void)jumpToURL{
    /*
    if([_szTargetUrl hasPrefix:@"http:"]){ // If it is HTTP URL
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString:_szTargetUrl]];
    }else if ([_szTargetUrl hasPrefix:@"mailto:"]){
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString: @"mailto:arkilis@gmail.com"]];
    }else{
        return;
    }
     */
    if(_szTargetUrl){
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString:_szTargetUrl]];
    }
}

#pragma mark -


@end
