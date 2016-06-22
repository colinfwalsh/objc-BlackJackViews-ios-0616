//
//  FISBlackjackViewController.h
//  objc-BlackJackViews
//
//  Created by Colin Walsh on 6/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISBlackjackGame.h"
#import "FISBlackjackPlayer.h"

@interface FISBlackjackViewController : UIViewController

//Neutral labels
@property (strong, nonatomic) IBOutlet UILabel *winnerLabel;
@property (strong, nonatomic) FISBlackjackGame *game;


//House labels
@property (strong, nonatomic) IBOutlet UILabel *houseLabel;
@property (strong, nonatomic) IBOutlet UILabel *houseStayedLabel;
@property (strong, nonatomic) IBOutlet UILabel *houseScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *houseWinsLabel;
@property (strong, nonatomic) IBOutlet UILabel *houseBustedLabel;
@property (strong, nonatomic) IBOutlet UILabel *houseLossesLabel;
@property (strong, nonatomic) IBOutlet UILabel *houseBlackjackLabel;

//Player labels
@property (strong, nonatomic) IBOutlet UILabel *playerLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerStayedLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerWinsLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerBustedLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerLossesLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerBlackjackLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerScoreLabel;

//House hand properties
@property (strong, nonatomic) IBOutlet UILabel *houseCard1;
@property (strong, nonatomic) IBOutlet UILabel *houseCard2;
@property (strong, nonatomic) IBOutlet UILabel *houseCard3;
@property (strong, nonatomic) IBOutlet UILabel *houseCard4;
@property (strong, nonatomic) IBOutlet UILabel *houseCard5;

//Player hand properties
@property (strong, nonatomic) IBOutlet UILabel *playerCard1;
@property (strong, nonatomic) IBOutlet UILabel *playerCard2;
@property (strong, nonatomic) IBOutlet UILabel *playerCard3;
@property (strong, nonatomic) IBOutlet UILabel *playerCard4;
@property (strong, nonatomic) IBOutlet UILabel *playerCard5;

//Button properties
@property (strong, nonatomic) IBOutlet UIButton *hitButton;
@property (strong, nonatomic) IBOutlet UIButton *stayButton;
@property (strong, nonatomic) IBOutlet UIButton *dealButton;

-(void)houseTurn;
-(void)houseOrPlayerWin;
-(void)hiddenValues;

@end
