//
//  Grid.m
//  DwarfForgeJam
//
//  Created by Oleg on 22/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import "Grid.h"
#import "Cell.h"

@interface Grid()

@property(assign, nonatomic)int width;
@property(assign, nonatomic)int height;

@property(assign, nonatomic)int columns;
@property(assign, nonatomic)int rows;

@property(assign, nonatomic)int cellWidth;
@property(assign, nonatomic)int cellHeight;

@property(assign, nonatomic)int numberOfCells;

@property(assign, nonatomic)int numberOfColors;

@end

@implementation Grid

- (instancetype)init
{
	if (self = [super init])
	{
		// Game Center
		[self gridWithWidth:320 height:320 columns:10 rows:10];
	}
	return self;
}

- (void)gridWithWidth:(int)width height:(int)height columns:(int)columns rows:(int)rows
{
	self.width = width;
	self.height = height;
	
	self.columns = columns;
	self.rows = rows;
	
	self.cellWidth = width / columns;
	self.cellHeight = height / rows;
	
	self.numberOfColors = 5;
	[self createCells];
}

- (void)createCells
{
	NSString *uni=@"\U0001d11e";
	NSString *uni2=[[NSString alloc] initWithUTF8String:"\xF0\x9D\x84\x9E"];
	NSString *uni3=@"𝄞";
	NSLog(@"unicode: %@ and %@ and %@",uni, uni2, uni3);

	for (int i = 0; i < self.columns; i++)
	{
		for (int j = 0; j < self.rows; j++)
		{
			Cell *cell = (Cell*)[CCBReader load:@"Cell"];
			[self addChild:cell];
			cell.positionType = CCPositionTypeNormalized;
			cell.position = ccp(i * 0.1, j * 0.1);
			
			int randomSymbolNumber = arc4random_uniform(self.numberOfColors) + 1;
			
//			NSString *uni= [NSString stringWithFormat:@"%C", (unichar)0x1d11e];
			NSLog(@"Random: %d", randomSymbolNumber);
			cell.colorNumber = randomSymbolNumber;
			cell.symbol.string = [NSString stringWithFormat:@"%d", randomSymbolNumber];
		}
	}
}


@end
