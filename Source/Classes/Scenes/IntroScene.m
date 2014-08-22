//
//  IntroScene.m
//  DwarfForgeJam
//
//  Created by Oleg on 22/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import "IntroScene.h"

@implementation IntroScene

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

#pragma mark - events

- (void)animationDidComplete
{
	CCScene *scene = [CCBReader loadAsScene:@"GameplayScene"];
	[[CCDirector sharedDirector] replaceScene:scene withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:0.3f]];
}
@end
