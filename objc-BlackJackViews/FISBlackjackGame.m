//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Colin Walsh on 6/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

- (instancetype) init {
    return [self initWithDeck:[[FISCardDeck alloc] init] House:[[FISBlackjackPlayer alloc] initWithName:@"House"] Player:[[FISBlackjackPlayer alloc] initWithName:@"Player"]];
}

- (instancetype) initWithDeck:(FISCardDeck*)deck House:(FISBlackjackPlayer*)house Player:(FISBlackjackPlayer*)player{
    self = [super init];
    
    if (self) {
        _deck = deck;
        _house = house;
        _player = player;
    }
    
    return self;}

-(void)playBlackjack{
    [self.deck resetDeck];
    
    [self.house resetForNewGame];
    [self.player resetForNewGame];
    
    [self dealNewRound];
    
    NSLog(@"%@ \n %@", self.player, self.house);
    
    
}

-(void)dealNewRound{
    [self dealCardToPlayer];
    [self dealCardToPlayer];
    
    [self dealCardToHouse];
    [self dealCardToHouse];
}

-(void)dealCardToPlayer{
    [self.player acceptCard:[self.deck drawNextCard]];
}

-(void)dealCardToHouse{
    [self.house acceptCard:[self.deck drawNextCard]];
}

-(void)processPlayerTurn{
    
    if (([self.player shouldHit] == true && self.player.stayed == false) && self.player.busted == false) {
        [self dealCardToPlayer];
    }
    
    
}

-(void)processHouseTurn{
    if (([self.house shouldHit] == true && self.house.stayed == false) && self.house.busted == false) {
        [self dealCardToHouse];
    }
}

-(BOOL)houseWins{
    
    if (self.house.blackjack && self.player.blackjack) {
        return NO;}
    
    if (self.house.busted) {
        return NO;}
    
    if (self.player.busted) {
        return YES;}
    
    if (self.player.handscore > self.house.handscore) {
        return NO;}
    
    return YES;
}

-(void)incrementWinsAndLossesForHouseWins:(BOOL)housewins{
    if (housewins == YES) {
        self.house.wins++;
        self.player.losses++;
    }
    else if (housewins == NO){
        self.player.wins++;
        self.house.losses++;}
}

@end
