//
//  Grid.m
//  DwarfForgeJam
//
//  Created by Oleg on 22/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import "Grid.h"
#import "GridCell.h"

static const NSInteger NumColumns = 7;
static const NSInteger NumRows = 8;

@interface Grid()

@property(assign, nonatomic)int width;
@property(assign, nonatomic)int height;

@property(assign, nonatomic)int columns;
@property(assign, nonatomic)int rows;

@property(assign, nonatomic)int cellWidth;
@property(assign, nonatomic)int cellHeight;

@property(assign, nonatomic)int numberOfCells;

@property(assign, nonatomic)int numberOfColors;

@property(assign, nonatomic)CCNode *gridCellsContainer;
@end

@implementation Grid {
	Cell *_cells[NumColumns][NumRows];
	GridCell *_gridCells[NumColumns][NumRows];

}

- (instancetype)init
{
	if (self = [super init])
	{
		
		[self gridWithWidth:320 height:365 columns:NumColumns rows:NumRows];
	}
	return self;
}

- (void)didLoadFromCCB
{
	_gridCellsContainer = [self getChildByName:@"gridCellsContainer" recursively:NO];
}

- (void)gridWithWidth:(int)width height:(int)height columns:(int)columns rows:(int)rows
{
	self.width = width;
	self.height = height;
	
	self.columns = columns;
	self.rows = rows;
	
	self.cellWidth = width / columns;
	self.cellHeight = height / rows;
	
	self.numberOfColors = 6;
	
}

- (void)placeCellsForLevel:(int)level
{
	NSDictionary *gridCellsDict = [self loadJSON:[NSString stringWithFormat:@"level_%d", level]];
	
	// Loop through the rows
	[gridCellsDict[@"cells"] enumerateObjectsUsingBlock:^(NSArray *array, NSUInteger row, BOOL *stop) {
		[array enumerateObjectsUsingBlock:^(NSNumber *value, NSUInteger column, BOOL *stop) {
			NSInteger tileRow = NumRows - row - 1;
			
			// If the value is 1, create a tile object.
			if ([value integerValue] == 1) {
				GridCell *gridCell = (GridCell*)[CCBReader load:@"GridCell"];
				_gridCells[column][tileRow] = gridCell;
				[_gridCellsContainer addChild:gridCell];
				gridCell.position = ccp(column * (self.cellWidth + 1), row * (self.cellHeight + 1));
			}
		}];
	}];

	[self placeCellsFromSet:[self createCells]];
}

- (void)placeGridCells
{
	for (int i = 0; i < self.columns; i++)
	{
		for (int j = 0; j < self.rows; j++)
		{
			GridCell *cell = _gridCells[i][j];
			if (cell) {
				[_gridCellsContainer addChild:cell];
				cell.position = ccp(i * (self.cellWidth + 1), j * (self.cellHeight + 1));
			}
		}
	}
}

- (Cell *)cellAtColumn:(int)column row:(int)row
{
	Cell *cell;
	if (column >= 0 && column < NumColumns && row >= 0 && row < NumRows) {
		cell = _cells[column][row];
	}else{
		NSLog(@"Out of bounds");
	}
	return cell;
}

- (NSSet*)createCells
{
	NSMutableSet *cellsSet = [NSMutableSet setWithCapacity:NumRows * NumColumns];
	for (int i = 0; i < self.columns; i++)
	{
		for (int j = 0; j < self.rows; j++)
		{
			if (_gridCells[i][j]) {
				int randomMaterialNumber = arc4random_uniform(self.numberOfColors);
				[cellsSet addObject:[self createCellAtColumn:i row:j withMaterial:randomMaterialNumber]];
			}
			
		}
	}
	return cellsSet;
}

- (Cell *)createCellAtColumn:(int)column row:(int)row withMaterial:(enum Materials)material
{
	Cell *cell = (Cell*)[[Cell alloc]initWithMaterial:material];
	cell.cellWidth = _cellWidth - 2;
	cell.cellHeight = _cellHeight - 2;
	cell.column = column;
	cell.row = row;
	
	_cells[column][row] = cell;
	
	return cell;
}

- (void)placeCellsFromSet:(NSSet*)set
{
	for (Cell *cell in set) {
		[self addChild:cell];
		cell.position = ccp(cell.column * (self.cellWidth + 1), cell.row * (self.cellHeight + 1));
	}
}

- (Cell*)cellForTouchLocation:(CGPoint)location
{
	
	// Find column and row on selected location
	
	//TODO: add borders around the column and row
	int column = location.x / self.cellWidth;
	int row = location.y / self.cellHeight;
	
	Cell *cell = [self cellAtColumn:column row:row];
	return cell;
}

- (void)removeCell:(Cell*)cell
{
	[cell destroy];
}

- (NSDictionary *)loadJSON:(NSString *)filename {
	NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"json"];
	if (path == nil) {
		NSLog(@"Could not find level file: %@", filename);
		return nil;
	}
	
	NSError *error;
	NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
	if (data == nil) {
		NSLog(@"Could not load level file: %@, error: %@", filename, error);
		return nil;
	}
	
	NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
	if (dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]]) {
		NSLog(@"Level file '%@' is not valid JSON: %@", filename, error);
		return nil;
	}
	
	return dictionary;
}

@end
