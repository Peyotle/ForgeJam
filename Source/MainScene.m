//
//  MainScene.m
//  DwarfForgeJam
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Peyotle. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene

+ (instancetype)scene
{
	return [[self alloc] init];
}

- (instancetype)init
{
	if (self = [super init])
	{
		
		
	}
	return self;
}

#pragma mark - events

- (void)startButtonPressed:(id)sender
{
	CCScene *scene = [CCBReader loadAsScene:@"GameplayScene"];
	[[CCDirector sharedDirector] replaceScene:scene withTransition:[CCTransition transitionFadeWithDuration:0.5]];

}
@end
