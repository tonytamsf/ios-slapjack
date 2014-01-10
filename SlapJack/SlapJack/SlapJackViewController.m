//
//  SlapJackViewController.m
//  SlapJack
//
//  Created by Tony Tam on 1/8/14.
//  Copyright (c) 2014 Yama Llama. All rights reserved.
//

#import "SlapJackViewController.h"
#import "PlayingCardDeck.h"

@interface SlapJackViewController ()

@property Deck * playingCardDeck;
@property int flipCount;

@end

@implementation SlapJackViewController

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
    return _playingCardDeck;
}

- (IBAction)flipCard:(UIButton *)sender {
    [sender setTitle:@"A" forState:UIControlStateNormal];
    [self increaseFlipCount];
}

- (void) increaseFlipCount {
    _flipCount ++;
    [self.flipLabel1 setText:[NSString stringWithFormat:@"Flip : %d", _flipCount]];


}
@end
