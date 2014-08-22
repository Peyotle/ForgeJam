//
//  GameplayScene.m
//  DwarfForgeJam
//
//  Created by Oleg on 22/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import "GameplayScene.h"
#import "Grid.h"

@interface GameplayScene()
@property (strong, nonatomic) Grid *grid;

@property (assign, nonatomic) BOOL *selectionStarted;

@end

@implementation GameplayScene

+ (instancetype)scene
{
	return [[self alloc] init];
}

- (instancetype)init
{
	if (self = [super init])
	{
		// Game Center
	}
	return self;
}

//TODO: Add cell touch
//TODO: Cell selection on finger move
//TODO: Destruction of connected cells
//TODO: Create word based on selected cells
//TODO: Add "required combinations" in top of the grid
//TODO: Match the word with required word from the top of the grid.

//TODO: Move cells down after destruction of some cells
//TODO Fill grid from top in the beginning of the game

@end
