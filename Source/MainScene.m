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
		[self startSoundtrack];
		
	}
	return self;
}

- (void)startSoundtrack
{
	// access audio object
	OALSimpleAudio *audio = [OALSimpleAudio sharedInstance];
	// play background sound
	[audio playBg:@"Hall of the Mountain King.mp3" loop:TRUE];
	
	
	// Sound preload
	[audio preloadEffect:@"your_file_name"];
	
	
//	OALSimpleAudio audio = [OALSimpleAudio sharedInstance];
//	[audio stopBg]; //to stop background audio only
//	or
//	[audio stopEverything]; // to stop all audio
}

#pragma mark - events

- (void)startButtonPressed:(id)sender
{
	CCScene *scene = [CCBReader loadAsScene:@"GameplayScene"];
	[[CCDirector sharedDirector] replaceScene:scene withTransition:[CCTransition transitionFadeWithDuration:0.5]];

}
@end
