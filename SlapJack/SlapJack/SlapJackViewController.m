//
//  SlapJackViewController.m
//  SlapJack
//
//  Created by Tony Tam on 1/8/14.
//  Copyright (c) 2014 Yama Llama. All rights reserved.
//

#import "SlapJackViewController.h"
#import "PlayingCardDeck.h"
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
#import "Debug.h"

@interface SlapJackViewController ()

@property int flipCount1;
@property int flipCount2;

@end

@implementation SlapJackViewController
//@synthesize playingCardDeck = _playingCardDeck;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.player1Label.layer.transform = CATransform3DMakeRotation(M_PI, 0.0f, 0.0f, 1.0f);
    self.player1Image.layer.transform =CATransform3DMakeRotation(M_PI, 0.0f, 0.0f, 1.0f);
    self.player1LookForLabel.layer.transform =CATransform3DMakeRotation(M_PI, 0.0f, 0.0f, 1.0f);
    self.player1CountLabel.layer.transform =CATransform3DMakeRotation(M_PI, 0.0f, 0.0f, 1.0f);
    [self.view setMultipleTouchEnabled:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Deck *) getPlayingCardDeck:(int) player
{
    if (player == 1 ) {
        if (! _playingCardDeck1) {
            _playingCardDeck1 = [[PlayingCardDeck alloc] init];

        }
        return _playingCardDeck1;

    } else {
        if (! _playingCardDeck2) {
            _playingCardDeck2 = [[PlayingCardDeck alloc] init];
        }
        return _playingCardDeck2;
    }
}

- (void) declareWinner {
    int winner = 1;
    if (_flipCount2 > _flipCount2) {
        winner = 2;
    }
    
    [self startGame];
}

- (void) startGame  {
    _flipCount1 = 0;
    _flipCount2 = 0;
    _playingCardDeck1 = _playingCardDeck2 = nil;
    [self.flipLabel1 setText:[NSString stringWithFormat:@"Cards Remaining: %d", 52 - _flipCount1]];
    [self.flipLabel2 setText:[NSString stringWithFormat:@"Cards Remaining: %d", 52 - _flipCount2]];
    NSString *cardFace = @"Done";
    self.player1Label.text = cardFace;
    self.player2Label.text = cardFace;
}


- (IBAction)flipCard:(UILabel *)sender forPlayer:(int) player{
    
    Card *card = [[self getPlayingCardDeck:player] drawRandomCard];
    NSString *cardFace = @"Done";
    
    if (card != nil) {
        cardFace = [card contents];
        [self increaseFlipCount:player];
    } else {
        [self declareWinner];
    }
    
    DLog(@"card = %@", card);
    sender.text = cardFace;
    //[self playSoundWithOfThisFile:@"ding.mp3"];
}

- (void) increaseFlipCount:(int) player {
    if (player == 1 ) {
        if (_flipCount1 < 52) {
            _flipCount1++;
            [self.flipLabel1 setText:[NSString stringWithFormat:@"Cards Remaining: %d", 52 - _flipCount1]];
        }
    } else {
        if (_flipCount2 < 52) {
            _flipCount2 ++;
            [self.flipLabel2 setText:[NSString stringWithFormat:@"Cards Remaining: %d", 52 - _flipCount2]];
        }
    }
}

// refactor this code
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];

    DLog(@"NSSet %@", touches);
    DLog(@"touched %@", touch);
    DLog(@"point %f %f", point.x, point.y);
    DLog(@"cneter  = %f %f", self.view.center.x, self.view.center.y);

    if (point.y > self.view.center.y) {
        [self flipCard:self.player2Label forPlayer:2];
        DLog(@"touched %@", touch.view);
    } else {
        [self flipCard:self.player1Label forPlayer:1];
        DLog(@"touched %@", touch.view);
    }
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
}

- (void)playSoundWithOfThisFile:(NSString*)fileNameWithExtension {
    
    // Eg - abc.mp3
    AVAudioPlayer *audioPlayerObj;
    
    NSString *filePath;
    
    filePath= [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] resourcePath]];
    
    DLog(@"filePath %@", filePath);
    if(!audioPlayerObj)
        audioPlayerObj = [[AVAudioPlayer alloc] init];
    
    NSURL *acutualFilePath= [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",filePath,fileNameWithExtension]];
    DLog(@"actual %@", acutualFilePath);

    NSError *error = [[NSError alloc] init];
    
    AVAudioPlayer * aup = [audioPlayerObj initWithContentsOfURL:acutualFilePath error:&error];
    DLog(@"error %@", error);
    
    [aup play];
    
}
@end
