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


@interface SlapJackViewController ()

@property int flipCount;

@end

@implementation SlapJackViewController
//@synthesize playingCardDeck = _playingCardDeck;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Deck *) getPlayingCardDeck
{
    if (! _playingCardDeck) {
        _playingCardDeck = [[PlayingCardDeck alloc] init];
    }
    NSLog(@"getPlayingCardDeck %@", _playingCardDeck);

    return _playingCardDeck;
}

- (IBAction)flipCard:(UIButton *)sender {
    
    Card *card = [[self getPlayingCardDeck] drawRandomCard];
    NSLog(@"cardDeck %@", [self getPlayingCardDeck]);
    NSLog(@"card = %@", card);
    
    [sender setTitle:[card contents] forState:UIControlStateNormal];
    [self increaseFlipCount];
    [self playSoundWithOfThisFile:@"ding.mp3"];
}

- (void) increaseFlipCount {
    _flipCount ++;
    [self.flipLabel1 setText:[NSString stringWithFormat:@"Flip : %d", _flipCount]];

}

// TODO
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch *touch = [touches anyObject];

    [self flipCard:nil];
}



- (void)playSoundWithOfThisFile:(NSString*)fileNameWithExtension {
    
    // Eg - abc.mp3
    AVAudioPlayer *audioPlayerObj;
    
    NSString *filePath;
    
    filePath= [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] resourcePath]];
    
    NSLog(@"filePath %@", filePath);
    if(!audioPlayerObj)
        audioPlayerObj = [[AVAudioPlayer alloc] init];
    
    NSURL *acutualFilePath= [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",filePath,fileNameWithExtension]];
    NSLog(@"actual %@", acutualFilePath);

    NSError *error = [[NSError alloc] init];
    
    [audioPlayerObj initWithContentsOfURL:acutualFilePath error:&error];
    NSLog(@"error %@", error);
    
    [audioPlayerObj play];
    
}
@end
