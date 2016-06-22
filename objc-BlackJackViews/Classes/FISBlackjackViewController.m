//
//  FISBlackjackViewController.m
//  objc-BlackJackViews
//
//  Created by Colin Walsh on 6/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackViewController.h"



@interface FISBlackjackViewController ()

@end

@implementation FISBlackjackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.game = [[FISBlackjackGame alloc] init];
    
    [self disableHitAndStay];
    
    // Do any additional setup after loading the view.
    self.playerStayedLabel.accessibilityLabel = @"playerStayed";
    [self hiddenValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)disableHitAndStay {
    self.hitButton.enabled = NO;
    self.stayButton.enabled = NO;
}

-(void)enableHitAndStay {
    self.hitButton.enabled = YES;
    self.stayButton.enabled = YES;}

-(void)hiddenValues{
    
    self.winnerLabel.hidden = YES;
    self.houseStayedLabel.hidden = YES;
    self.houseBustedLabel.hidden = YES;
    self.houseBlackjackLabel.hidden = YES;
    self.houseCard1.hidden = YES;
    self.houseCard2.hidden = YES;
    self.houseCard3.hidden = YES;
    self.houseCard4.hidden = YES;
    self.houseCard5.hidden = YES;
    self.houseScoreLabel.hidden = YES;
    self.playerStayedLabel.hidden = YES;
  
    self.playerBustedLabel.hidden = YES;
    self.playerBlackjackLabel.hidden= YES;
    self.playerCard1.hidden = YES;
    self.playerCard2.hidden = YES;
    self.playerCard3.hidden = YES;
    self.playerCard4.hidden = YES;
    self.playerCard5.hidden = YES;
    self.playerScoreLabel.hidden = YES;
}



-(void)houseOrPlayerWin{
    if ([self.game houseWins] == YES) {
        [self disableHitAndStay];
        self.dealButton.enabled = YES;
        self.winnerLabel.hidden = NO;
        self.winnerLabel.text = @"You Lose!";
        [self.game incrementWinsAndLossesForHouseWins:YES];
        self.houseWinsLabel.text = [NSString stringWithFormat:@"Wins: %li", self.game.house.wins];
        self.playerLossesLabel.text = [NSString stringWithFormat:@"Losses: %li", self.game.player.losses];
    }
    
    if ([self.game houseWins] == NO){
        [self disableHitAndStay];
        self.dealButton.enabled = YES;
        self.winnerLabel.hidden = NO;
        self.winnerLabel.text = @"You Win!";
        [self.game incrementWinsAndLossesForHouseWins:NO];
        self.playerWinsLabel.text = [NSString stringWithFormat:@"Wins: %li", self.game.player.wins];
        self.houseLossesLabel.text = [NSString stringWithFormat:@"Losses: %li", self.game.house.losses];
    }
    
}

- (IBAction)dealButton:(id)sender {
    
    [self hiddenValues];
    
    self.dealButton.enabled = NO;
    
    //Globals
    NSLog(@"%@", @"YOURE DEALING");
    
    [self disableHitAndStay];
    
    [self.game.deck resetDeck];
    
    [self.game.house resetForNewGame];
    [self.game.player resetForNewGame];
    
    [self.game dealNewRound];
    
    self.playerScoreLabel.hidden = NO;
    self.houseScoreLabel.hidden = NO;
    
    //Gets values for house hand
    FISCard *houseHand1 = self.game.house.cardsInHand[0];
    FISCard *houseHand2 = self.game.house.cardsInHand[1];
    
    
    //Gets values for player hand
    FISCard *playerHand1 = self.game.player.cardsInHand[0];
    FISCard *playerHand2 = self.game.player.cardsInHand[1];
    
    //House calls
    self.houseCard1.hidden = NO;
    self.houseCard2.hidden = NO;
    self.houseCard1.text = houseHand1.cardLabel;
    self.houseCard2.text = houseHand2.cardLabel;
    self.houseScoreLabel.text = [NSString stringWithFormat:@"%li", self.game.house.handscore];
    
    //  Player calls
    self.playerCard1.hidden = NO;
    self.playerCard2.hidden = NO;
    self.playerCard1.text = playerHand1.cardLabel;
    self.playerCard2.text = playerHand2.cardLabel;
    self.playerScoreLabel.text = [NSString stringWithFormat:@"%li", self.game.player.handscore];
    
    if (self.game.player.blackjack == true) {
        self.playerBlackjackLabel.hidden = NO;
        [self houseOrPlayerWin];
    }
    else if (self.game.house.blackjack == true) {
        self.houseBlackjackLabel.hidden = NO;
        [self houseOrPlayerWin];}
    else if (self.game.house.busted == true){
        [self houseOrPlayerWin];
        self.houseBustedLabel.hidden = NO;
    }
    else {
        [self enableHitAndStay];}
    
    
    
    
    
    
    
    
}
-(void)houseTurn{
    [self.game processHouseTurn];
    
    if ([self.game.house.cardsInHand count] == 3) {
        self.houseCard3.hidden = NO;
        FISCard *houseHand3 = self.game.house.cardsInHand[2];
        self.houseCard3.text = houseHand3.cardLabel;
        self.houseScoreLabel.text = [NSString stringWithFormat:@"%li", self.game.house.handscore];
        
    }
    
    else if ([self.game.house.cardsInHand count] == 4){
        self.houseCard4.hidden = NO;
        FISCard *houseHand4 = self.game.house.cardsInHand[3];
        self.houseCard4.text = houseHand4.cardLabel;
        self.houseScoreLabel.text = [NSString stringWithFormat:@"%li", self.game.house.handscore];
    }
    
    else if ([self.game.house.cardsInHand count] == 5){
        self.houseCard5.hidden = NO;
        FISCard *houseHand5 = self.game.house.cardsInHand[4];
        self.houseCard5.text = houseHand5.cardLabel;
        self.houseScoreLabel.text = [NSString stringWithFormat:@"%li", self.game.house.handscore];
    }
    
    if (self.game.house.stayed == true){
        self.houseStayedLabel.hidden = NO;}
    
    else if (self.game.house.busted == true){
        [self houseOrPlayerWin];
        self.houseBustedLabel.hidden = NO;
        }
    
}

- (IBAction)hitButton:(id)sender {
    
    NSLog(@"%@", @"YOU'RE HITTING");
    
    [self.game dealCardToPlayer];
    
    if ([self.game.player.cardsInHand count] == 3) {
        self.playerCard3.hidden = NO;
        FISCard *playerHand3 = self.game.player.cardsInHand[2];
        self.playerCard3.text = playerHand3.cardLabel;
        self.playerScoreLabel.text = [NSString stringWithFormat:@"%li", self.game.player.handscore];
        
    }
    
    else if ([self.game.player.cardsInHand count] == 4) {
        self.playerCard4.hidden = NO;
        FISCard *playerHand4 = self.game.player.cardsInHand[3];
        self.playerCard4.text = playerHand4.cardLabel;
        self.playerScoreLabel.text = [NSString stringWithFormat:@"%li", self.game.player.handscore];
    }
    
    else if ([self.game.player.cardsInHand count] == 5) {
        self.playerCard5.hidden = NO;
        FISCard *playerHand5 = self.game.player.cardsInHand[4];
        self.playerCard5.text = playerHand5.cardLabel;
        self.playerScoreLabel.text = [NSString stringWithFormat:@"%li", self.game.player.handscore];
    }
    
    if (self.game.player.busted == NO && self.game.player.blackjack == NO) {
        [self houseTurn];
    }
    else if (self.game.player.busted == true) {
        [self houseOrPlayerWin];
        self.playerBustedLabel.hidden = NO;}
    else {
        [self houseOrPlayerWin];}
    
}

- (IBAction)stayButton:(id)sender {
    NSLog(@"%@", @"YOURE STAYING");
    
    if(self.game.player.stayed == true){
        self.playerStayedLabel.hidden = NO;}
    
    
    [self houseTurn];
    [self houseOrPlayerWin];
    
    
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
