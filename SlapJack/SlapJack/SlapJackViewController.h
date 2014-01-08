//
//  SlapJackViewController.h
//  SlapJack
//
//  Created by Tony Tam on 1/8/14.
//  Copyright (c) 2014 Yama Llama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface SlapJackViewController : UIViewController
- (Deck *) getPlayingCardDeck;

@property (weak, nonatomic) IBOutlet UILabel *flipLabel;

@end
