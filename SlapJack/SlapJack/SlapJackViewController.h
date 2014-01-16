//
//  SlapJackViewController.h
//  SlapJack
//
//  Created by Tony Tam on 1/8/14.
//  Copyright (c) 2014 Yama Llama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "Card.h"

@interface SlapJackViewController : UIViewController
//- (Deck *) getPlayingCardDeck;
@property (weak, nonatomic) IBOutlet UILabel *flipLabel1;

@property Deck * playingCardDeck1;

@property Deck * playingCardDeck2;

- (void)playSoundWithOfThisFile:(NSString*)fileNameWithExtension;

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;

@property (weak, nonatomic) IBOutlet UILabel *player1Label;

@property (weak, nonatomic) IBOutlet UIImageView *player1Image;

@property (weak, nonatomic) IBOutlet UILabel *player1LookForLabel;

@property (weak, nonatomic) IBOutlet UILabel *player2LookForLabel;

@property (weak, nonatomic) IBOutlet UILabel *player2CountLabel;

@property (weak, nonatomic) IBOutlet UILabel *player2Label;

@property (weak, nonatomic) IBOutlet UILabel *player1CountLabel;

@property (weak, nonatomic) IBOutlet UILabel *flipLabel2;

@end
