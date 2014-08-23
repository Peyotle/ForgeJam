//
//  GameRules.m
//  DwarfForgeJam
//
//  Created by Oleg on 23/08/14.
//  Copyright (c) 2014 Peyotle. All rights reserved.
//

#import "GameRules.h"

@implementation GameRules

+ (GameRules*)sharedRules
{
	static GameRules *sharedRules;
	
	@synchronized(self){
		if (sharedRules == nil) {
			sharedRules = [[self alloc]init];
		}
	}
	return sharedRules;
}

- (BOOL)shouldSelectCell:(Cell*)cell
{
	
	return YES;
}
@end
