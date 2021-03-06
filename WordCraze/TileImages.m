//
//  tileImages.m
//  Droozle
//
//  Created by Jason Deckman on 12/26/15.
//  Copyright © 2015 JDeckman. All rights reserved.
//

#import "TileImages.h"

@implementation TileImages

@synthesize pieceSize;

- (void)setUp:(CGSize)frm {

    images = [[NSMutableArray alloc] initWithCapacity:25];
    
    pieceSize = frm;
    
    [self loadImages];
}

- (void)loadImages {
    
    UIGraphicsBeginImageContext(pieceSize);
    
    UIImage *tmpImage = [UIImage imageNamed:@"redSquare.png"];
  //  [tmpImage drawInRect:CGRectMake(0, 0, pieceSize.width, pieceSize.height)];
  //  tmpImage = UIGraphicsGetImageFromCurrentImageContext();
    
  //  [images addObject:[UIColor colorWithPatternImage:tmpImage]];
    //[images addObject:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.4]];colorWithPatternImage:tmpImage]];
    
    [images addObject:[UIColor clearColor]];
    
    tmpImage = [UIImage imageNamed:@"p1.png"];
    [tmpImage drawInRect:CGRectMake(0, 0, pieceSize.width, pieceSize.height)];
    tmpImage = UIGraphicsGetImageFromCurrentImageContext();

    [images addObject:[UIColor colorWithPatternImage:tmpImage]];
    
    tmpImage = [UIImage imageNamed:@"p2.png"];
    [tmpImage drawInRect:CGRectMake(0, 0, pieceSize.width, pieceSize.height)];
    tmpImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [images addObject:[UIColor colorWithPatternImage:tmpImage]];
    
    tmpImage = [UIImage imageNamed:@"p3.png"];
    [tmpImage drawInRect:CGRectMake(0, 0, pieceSize.width, pieceSize.height)];
    tmpImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [images addObject:[UIColor colorWithPatternImage:tmpImage]];
    
    tmpImage = [UIImage imageNamed:@"p4.png"];
    [tmpImage drawInRect:CGRectMake(0, 0, pieceSize.width, pieceSize.height)];
    tmpImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [images addObject:[UIColor colorWithPatternImage:tmpImage]];
    
    tmpImage = [UIImage imageNamed:@"p5.png"];
    [tmpImage drawInRect:CGRectMake(0, 0, pieceSize.width, pieceSize.height)];
    tmpImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [images addObject:[UIColor colorWithPatternImage:tmpImage]];
    [images addObject:[images objectAtIndex:0]];
    
    tmpImage = [UIImage imageNamed:@"p7.png"];
    [tmpImage drawInRect:CGRectMake(0, 0, pieceSize.width, pieceSize.height)];
    tmpImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [images addObject:[UIColor colorWithPatternImage:tmpImage]];
    [images addObject:[images objectAtIndex:0]];
    [images addObject:[images objectAtIndex:0]];
    
    tmpImage = [UIImage imageNamed:@"p10.png"];
    [tmpImage drawInRect:CGRectMake(0, 0, pieceSize.width, pieceSize.height)];
    tmpImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [images addObject:[UIColor colorWithPatternImage:tmpImage]];
    [images addObject:[images objectAtIndex:0]];
    
    tmpImage = [UIImage imageNamed:@"p12.png"];
    [tmpImage drawInRect:CGRectMake(0, 0, pieceSize.width, pieceSize.height)];
    tmpImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [images addObject:[UIColor colorWithPatternImage:tmpImage]];
    
    tmpImage = [UIImage imageNamed:@"orangeSquare.png"];
    [tmpImage drawInRect:CGRectMake(0, 0, pieceSize.width, pieceSize.height)];
    tmpImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [images addObject:[UIColor colorWithPatternImage:tmpImage]];
    
    [images addObject:[images objectAtIndex:0]];
    [images addObject:[images objectAtIndex:0]];
    [images addObject:[images objectAtIndex:0]];

}

- (UIColor*)backgroundImageForIndex:(int)ind {
    
    if(ind < 0)
        return [images objectAtIndex:0];
    
    return [images objectAtIndex:ind];
}

- (void)deconstruct {

    UIColor *clr;
    
    for(int i=0; i<[images count]; i++) {
        
        clr = images[i];
        clr = nil;
    }
    
    [images removeAllObjects];
    
    images = nil;
}

@end
