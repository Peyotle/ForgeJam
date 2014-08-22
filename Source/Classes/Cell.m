//
//  Cell.m
//  DwarfForgeJam
//
//  Created by Oleg on 22/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import "Cell.h"

@interface Cell()
@property (strong, nonatomic)NSArray *colorsAray;
@property (strong, nonatomic)CCNodeColor *colorCell;
@end

@implementation Cell


- (instancetype)init
{
	if (self = [super init])
	{
		
	}
	return self;
}

- (void)setColorNumber:(int)colorNumber
{
	_colorNumber = colorNumber;
	self.colorCell.color = [CCColor colorWithUIColor:self.colorsAray[colorNumber-1]];
}

- (NSArray *)colorsAray
{
	if (_colorsAray)
		return _colorsAray;
	
	_colorsAray = @[
					[UIColor colorWithRed:255/255.0f green:115/255.0f blue:252/255.0f alpha:1.0f], //Pink
					[UIColor colorWithRed:96/255.0f green:1/255.0f blue:142/255.0f alpha:1.0f], //Violet
					[UIColor colorWithRed:42/255.0f green:54/255.0f blue:252/255.0f alpha:1.0f], //Blue
					[UIColor colorWithRed:96/255.0f green:232/255.0f blue:238/255.0f alpha:1.0f], //Bluish
					[UIColor colorWithRed:42/255.0f green:240/255.0f blue:51/255.0f alpha:1.0f], //Gren
					[UIColor colorWithRed:255/255.0f green:240/255.0f blue:51/255.0f alpha:1.0f], // Yellow
					[UIColor colorWithRed:255/255.0f green:176/255.0f blue:46/255.0f alpha:1.0f], //Orange
					[UIColor colorWithRed:255/255.0f green:1/255.0f blue:0/255.0f alpha:1.0f] //Red
					];
	return _colorsAray;
}

@end
