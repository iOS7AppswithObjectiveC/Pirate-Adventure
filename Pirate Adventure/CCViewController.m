//
//  CCViewController.m
//  Pirate Adventure
//
//  Created by ED on 4/27/15.
//  Copyright (c) 2015 SwiftBeard. All rights reserved.
//

#import "CCViewController.h"
#import "CCFactory.h"
#import "CCTile.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	CCFactory *factory = [[CCFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.currentPoint = CGPointMake(0, 0);
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButton];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButtonpressed:(UIButton *)sender
{
    CCTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    [self updateTile];
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y +1);
    
    [self updateButton];
    [self updateTile];
    
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
     self.currentPoint = CGPointMake(self.currentPoint.x +1, self.currentPoint.y);
    
    [self updateButton];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    
     self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y -1);

    [self updateButton];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
     self.currentPoint = CGPointMake(self.currentPoint.x -1, self.currentPoint.y);
    
    [self updateButton];
    [self updateTile];
    
}

-(void)updateTile
{
    CCTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    
    
    
}

-(void)updateButton
{
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x -1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x +1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y +1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y -1)];
    
}

-(BOOL)tileExistsAtPoint:(CGPoint)point
{
    if (point.y >=0 && point.x >=0 && point.x < [self.tiles count]&& point.y < [[self.tiles objectAtIndex:point.x] count]){
        return NO;
    } else {
        return YES;
    }
}

-(void)updateCharacterStatsForArmor:(CCArmor *)armor withWeapons:(CCWeapon *)weapon withHealthEffect:(int)healthEffect
{
    if (armor != nil){
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0){
        self.character.health = self.character.health + healthEffect;
    }
    else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}

@end
