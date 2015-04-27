//
//  CCFactory.m
//  Pirate Adventure
//
//  Created by ED on 4/27/15.
//  Copyright (c) 2015 SwiftBeard. All rights reserved.
//

#import "CCFactory.h"
#import "CCTile.h"

@implementation CCFactory

-(NSArray *)tiles
{
    CCTile *tile1 = [[CCTile alloc] init];
    tile1.story = @"story 1";
    
    CCTile *tile2 = [[CCTile alloc] init];
    tile2.story = @"story 2";
    
    CCTile *tile3 = [[CCTile alloc] init];
    tile3.story = @"story 3";
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
     
    CCTile *tile4 = [[CCTile alloc] init];
    tile4.story = @"story 4";
    
    CCTile *tile5 = [[CCTile alloc] init];
    tile5.story = @"story 5";
    
    CCTile *tile6 = [[CCTile alloc] init];
    tile6.story = @"story 6";
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    CCTile *tile7 = [[CCTile alloc] init];
    tile7.story = @"story 7";
    
    CCTile *tile8 = [[CCTile alloc] init];
    tile8.story = @"story 8";
    
    CCTile *tile9 = [[CCTile alloc] init];
    tile9.story = @"story 9";
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    CCTile *tile10 = [[CCTile alloc] init];
    tile10.story = @"story 10";
    
    CCTile *tile11 = [[CCTile alloc] init];
    tile11.story = @"story 11";
    
    CCTile *tile12 = [[CCTile alloc] init];
    tile12.story = @"story 12";
    
    NSMutableArray *forthColumn = [[NSMutableArray alloc] init];
    [forthColumn addObject:tile10];
    [forthColumn addObject:tile11];
    [forthColumn addObject:tile12];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, forthColumn, nil];
    
    return tiles;
    
}

@end
