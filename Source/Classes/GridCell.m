//
//  GridCell.m
//  DwarfForgeJam
//
//  Created by Oleg on 23/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import "GridCell.h"


@implementation GridCell

- (instancetype)init
{
	if (self = [super init])
	{
		
	
	}
	return self;
}

- (void)setTemperature:(NSInteger *)temperature
{
	_temperature = temperature;
	//TODO: change color of cell based on temperature
}
@end
