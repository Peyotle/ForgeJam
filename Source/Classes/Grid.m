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
		[self gridWithWidth:320 height:320 columns:7 rows:7];
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
	for (int i = 0; i < self.columns; i++)
	{
		for (int j = 0; j < self.rows; j++)
		{
			int randomMaterialNumber = arc4random_uniform(self.numberOfColors);

			Cell *cell = [[Cell alloc]initWithMaterial:randomMaterialNumber];
			cell.cellWidth = _cellWidth;
			cell.cellHeight = _cellHeight;
			[self addChild:cell];
//			cell.positionType = CCPositionTypeNormalized;
			cell.position = ccp(i * _cellWidth, j * _cellHeight);
			
//			cell.colorNumber = randomSymbolNumber;
//			cell.symbol.string = [NSString stringWithFormat:@"%d", randomSymbolNumber];
		}
	}
}


@end
