//
//  Display.h
//  Droozle
//
//  Created by Jason Deckman on 9/21/15.
//  Copyright (c) 2015 JDeckman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Colors.h"
#import "Space.h"
#import "MenuView.h"
#import "GamePlay.h"

@interface Display : NSObject {
    
    UIView *topBar;
    UIView *bottomBar;
    UIView *boardView;
    UIView *rootView;
    UIView *alertView;
    
    MenuView *menuView;
    
    UILabel *floatPiece;
    UILabel *addPiece;
    
    UILabel *scoreBox;
    UILabel *levelBox;
    UILabel *nextBox;
    
    UILabel *score;
    UILabel *level;
    UILabel *nextScore;
    
    UILabel *scoreLabel;
    UILabel *levelLabel;
    UILabel *nextScoreLabel;
    
    UIImage *floatBackImage;
    
    UIImageView *menuBar;
    
    CGSize floatPieceOffSet;
    CGSize addPieceOffSet;
    
    CGRect baseAddPiece;
    
    GamePlay *gamePlay;
}

@property(nonatomic, strong) UIView *topBar;
@property(nonatomic, strong) UIView *boardView;
@property(nonatomic, strong) UIView *bottomBar;

@property(nonatomic, strong) MenuView *menuView;

@property(nonatomic, strong) UILabel *floatPiece;
@property(nonatomic, strong) UILabel *addPiece;

@property(nonatomic, strong) UIImageView *menuBar;

@property(nonatomic, strong) GamePlay *gamePlay;

- (void)initDisplay:(CGRect)viewFrame :(UIViewController*)rootViewCont;
- (void)setUpColors;
- (void)setUpFloatPieces:(CGRect)pcFrm;
- (void)changeFloatPieceLoc: (CGPoint)newLoc;
- (void)configureFloatPiece: (Space*)space;
- (void)changeAddPieceLoc: (CGPoint)newLoc;
- (void)resetAddPiece;
- (void)deconstruct;
- (void)updateScore:(int)newScore;
- (void)hideAlertView;
- (void)updateLevelValues;
- (void)animateAlertView;

- (CGRect)initBoardView:(CGRect)viewFrame;

@end
