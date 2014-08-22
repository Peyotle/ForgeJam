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

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	//TODO: Add cell touch
}


- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	//TODO: Cell selection on finger move
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	
	//TODO: Deselect all selected cells if no matches
	
	//TODO: Deselect all selected cells if touch ended not on the grid
	//TODO: Destroy all selected and matching cells
	
}

- (void)touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
	//TODO: Deselect all selected cells
	
}

- (void)destroyCells:(NSArray*)cells
{
	//TODO: Count scores if cells matches
}

- (void)deselectCells:(NSArray*)cells
{
	
}

//TODO: Destruction of connected cells
//TODO: Create word based on selected cells
//TODO: Add "required combinations" in top of the grid
//TODO: Match the word with required word from the top of the grid.

//TODO: Move cells down after destruction of some cells
//TODO Fill grid from top in the beginning of the game

@end
