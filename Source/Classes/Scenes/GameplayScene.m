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

- (void)instantiateGrid
{
	
}

@end
