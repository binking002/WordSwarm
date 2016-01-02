//
//  WordBar.m
//  Droozle
//
//  Created by Jason Deckman on 12/31/15.
//  Copyright © 2015 JDeckman. All rights reserved.
//

#import "WordBar.h"
#import <UIKit/UIKit.h>
#import "Constants.h"

#define BOX_SPACING_FACT 0.05

@implementation WordBar

@synthesize letters, barBackground;
@synthesize wordCategory, boxesFilled;
@synthesize lettersInLevel;

- (void)setUp:(uint)nLetters :(CGRect)frame :(CGFloat)offset :(UIView*)rView {
 
    CGRect frm = frame;
    
    rootView = rView;
    
    xOffset = offset;
    
    numLetters = nLetters;
    letterPosition = 0;
    lettersInLevel = nLetters;
    
    borderColor = [UIColor colorWithRed:0.9 green:0.6 blue:0.2 alpha:1.0];
    
    frm.size.height *= WORD_BAR_FACT;
    frm.origin.y = frame.size.height;
    
    barBackground = [[UILabel alloc] initWithFrame:frm];
    
    barBackground.hidden = NO;
    barBackground.layer.borderColor = [[UIColor clearColor] CGColor];//[[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.8] CGColor];
    
    barBackground.layer.cornerRadius = 0.0;
    barBackground.clipsToBounds = YES;
    barBackground.opaque = NO;
    barBackground.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.8];
    
    [rootView addSubview:barBackground];
    
    letters = [[NSMutableArray alloc] initWithCapacity:nLetters];
    
    UILabel *letterLabel;
    
    frm = barBackground.frame;

    frm.size.height *= 0.85;
    frm.size.width = frm.size.height;
  //  frm.origin.x = 0;//xOffset;// + 0.15*offset;
    frm.origin.y += 0.2*frm.size.height;// -= 0.1*frm.size.height;
    frm.origin.x = (rootView.frame.size.width - nLetters*frm.size.width - (nLetters-1)*BOX_SPACING_FACT*frm.size.width)/2.0;
    
    UIGraphicsBeginImageContext(frm.size);
    
    UIImage *tmpImage = [UIImage imageNamed:@"p1.png"];
    [tmpImage drawInRect:CGRectMake(0, 0, frm.size.width, frm.size.height)];
    tmpImage = UIGraphicsGetImageFromCurrentImageContext();

    letterBackColor = [UIColor colorWithPatternImage:tmpImage];

    for(int i=0; i<nLetters; i++) {
        
        letterLabel = [[UILabel alloc] initWithFrame:frm];
        
        [rootView addSubview:letterLabel];
        [letters addObject:letterLabel];

        letterLabel.hidden = NO;
        letterLabel.layer.cornerRadius = 7.0;
        letterLabel.clipsToBounds = YES;
        letterLabel.opaque = NO;
        
        [letterLabel setTextAlignment:NSTextAlignmentCenter];
        [letterLabel setFont:[UIFont fontWithName:@"Arial" size:1.35*FONT_FACT*frm.size.width]];
        letterLabel.textColor = [UIColor blackColor];
      //  letterLabel.layer.borderColor = [borderColor CGColor];
                                         
      //  [self makeLetterSquareUnOccupied:i];
        
        letterLabel.layer.borderWidth = 1.5f;
        letterLabel.text = @"";
        
        frm.origin.x += frm.size.width + BOX_SPACING_FACT*frm.size.width;
    }
    
    animatePiece = [[UILabel alloc] initWithFrame:letterLabel.frame];
    
    animatePiece.hidden = YES;
    animatePiece.layer.cornerRadius = 7.0;
    animatePiece.clipsToBounds = YES;
    animatePiece.opaque = NO;
    
    [animatePiece setTextAlignment:NSTextAlignmentCenter];
    [animatePiece setFont:[UIFont fontWithName:@"Arial" size:1.35*FONT_FACT*frm.size.width]];
    animatePiece.textColor = [UIColor blackColor];
    animatePiece.layer.borderColor = [[UIColor colorWithRed:0.8 green:0.6 blue:0.2 alpha:1.0] CGColor];

    boxesFilled = NO;
    
    [self hideAllLetters];
 }

- (void)addLetterToBox:(NSString*)letter {
    
    if(!boxesFilled) {
   
        UILabel *square = letters[letterPosition];
    
        ++letterPosition;
    
        if(letterPosition >= lettersInLevel)
            boxesFilled = YES;
    
        square.backgroundColor = letterBackColor;
        square.layer.borderColor = [[UIColor clearColor] CGColor];
        
        square.text = letter;
    }
}

- (void)makeLetterSquareUnOccupied:(uint)squareNum {
    
    UILabel *square = letters[squareNum];
    
    square.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.4];
    square.layer.borderColor = [borderColor CGColor];
    
    square.text = @"";
}

- (void)clearLetters {
    
    for(uint i=0; i<lettersInLevel; i++)
        [self makeLetterSquareUnOccupied:i];
    
    boxesFilled = NO;
    
    letterPosition = 0;
}

- (NSString*)makeWordFromLetters {

    NSMutableString *word = [[NSMutableString alloc] initWithString:@""];
    
    UILabel *letter;
    
    for(uint i=0; i<lettersInLevel; i++) {
        
        letter = letters[i];
        
        [word appendString:letter.text];
    }
    
    return word;
}

- (uint)numOccupied {

    return letterPosition;
}

- (void)setUpForLevel:(int)level {
    
    UILabel *box = letters[0];
    
  //  CGRect frame = box.frame;

    lettersInLevel = [self getNumWordBarLettersForLevel:level];
    letterPosition = 0;
    
  //  frame.origin.x = (rootView.frame.size.width - lettersInLevel*frame.size.width -(lettersInLevel-1)*BOX_SPACING_FACT*frame.size.width)/2.0;
    
    [self hideAllLetters];
    [self clearLetters];
    
    boxesFilled = NO;
    
    for(int i=0; i<lettersInLevel; i++) {
        
        box = letters[i];
        
        box.hidden = NO;
    //    box.frame = frame;
        
        [self makeLetterSquareUnOccupied:i];
        
      //  frame.origin.x += box.frame.size.width + BOX_SPACING_FACT*box.frame.size.width;
    }
}

- (uint)getNumWordBarLettersForLevel:(int)level {
    
    if(level == 1)
        return 3;
    else if(level == 2 || level == 3)
        return 4;
    else if(level == 4 || level == 5 || level == 6)
        return 5;
    else if(level == 7 || level == 8 || level == 9)
        return 6; 
    
    return numLetters;
}

- (void)hideAllLetters {

    UILabel *box;
    
    for(int i=0; i<numLetters; i++) {
        
        box = letters[i];
        
        box.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.35];
        box.layer.borderColor = [[UIColor clearColor] CGColor];
        box.text = @"";
    }
    
}

- (BOOL)animatePieceToEmptySpace:(UILabel*)origin :(CGFloat)duration :(CGFloat)delay {

    if(letterPosition >= lettersInLevel || boxesFilled)
        return YES;
    
    UILabel *destinationBox = letters[letterPosition];
    CGRect frm = origin.frame;
    
    __block NSString *letterToAdd;
    
    frm.origin = destinationBox.frame.origin;
    
    animatePiece.frame = origin.frame;
    animatePiece.backgroundColor = origin.backgroundColor;
    animatePiece.text = origin.text;
    animatePiece.textColor = origin.textColor;
    
    animatePiece.hidden = NO;
    
    [rootView addSubview:animatePiece];
    
    letterToAdd = origin.text;
    
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        animatePiece.frame = frm;
        
    } completion:^(BOOL finished) {
        
        animatePiece.hidden = YES;
        [animatePiece removeFromSuperview];
        
        [self addLetterToBox:letterToAdd];
    }];
    
    return NO;
}

- (void)deconstruct {
    
    UILabel *letter;
    
    for(int i=0; i<[letters count]; i++) {
        
        letter = letters[i];
        [letter removeFromSuperview];
        letter = nil;
    }
    
    [letters removeAllObjects];
    letters = nil;
    
    [barBackground removeFromSuperview];
    barBackground = nil;
    
    letterBackColor = nil;
    borderColor = nil;
    wordCategory = nil;
}

@end

