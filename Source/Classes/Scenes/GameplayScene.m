//
//  GameplayScene.m
//  DwarfForgeJam
//
//  Created by Oleg on 22/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import "GameplayScene.h"
#import "Grid.h"
#import "GameRules.h"

@interface GameplayScene()
@property (strong, nonatomic) Grid *grid;
@property (strong, nonatomic) NSMutableArray *selectedCells;
@property (strong, nonatomic) CCLabelTTF *goldLabel;
@property (strong, nonatomic) CCLabelTTF *completionLabel;

@property (assign, nonatomic) BOOL selectionStarted;
@property (assign, nonatomic) BOOL touchIsOutOfBounds;

@property (assign, nonatomic) int goldForOneCell;

@property (assign, nonatomic) int gold;
@property (assign, nonatomic) int completion;
@property (assign, nonatomic) BOOL introIsPresented;


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
		self.userInteractionEnabled = YES;
		self.selectedCells = [NSMutableArray array];
		self.goldForOneCell = 10;
		self.gold = 0;
		self.completion = 0;
	}
	return self;
}

- (void)showIntroScreen
{
	CCNode *introScreen = [CCBReader load:@"Intro_Level_1"];
	[self addChild:introScreen];
	introScreen.name = @"introScreen";
	self.introIsPresented = YES;
}

- (void)didLoadFromCCB
{
	[_grid placeCellsForLevel:1];
	self.gold = 0;
	self.completion = 0;
	[self showIntroScreen];
}

- (BOOL)canSelectCell:(Cell*)cell
{
	Cell *lastSelectedCell = self.selectedCells.lastObject;
	
	if (cell && !cell.isSelected && lastSelectedCell.material == cell.material){
		
		//Check cell position
		if (cell.column == lastSelectedCell.column ||
			cell.column == lastSelectedCell.column + 1 ||
			cell.column == lastSelectedCell.column - 1)
		{
			if (cell.row == lastSelectedCell.row ||
				cell.row == lastSelectedCell.row + 1 ||
				cell.row == lastSelectedCell.row - 1)
			{
				return YES;
			}
		}
	}
	return NO;
}

- (BOOL)canDeleteSelectedCells
{
	if (_selectedCells.count > 2 && !self.touchIsOutOfBounds) {
		return YES;
	}
	
	return NO;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	if (self.introIsPresented) {
		CCNode *introScreen = [self getChildByName:@"introScreen" recursively:NO];
		if (introScreen) {
			CCActionFiniteTime *fadeAction = [CCActionFadeOut actionWithDuration:0.5];
			CCActionFiniteTime *actionRemove = [CCActionCallBlock actionWithBlock:^{
				[introScreen removeFromParent];
				self.introIsPresented = NO;
			}];
			CCActionSequence *sequence = [CCActionSequence actionOne:fadeAction two:actionRemove];
			[introScreen runAction:sequence];
		}
		
	}
	self.selectedCells = [NSMutableArray array];
	CGPoint touchLocation = [touch locationInNode:_grid];
	Cell *cell = [_grid cellForTouchLocation:touchLocation];
	
	if (cell && !cell.isSelected) {
		cell.isSelected = !cell.isSelected;
		[self.selectedCells addObject:cell];
	}
}


- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	CGPoint touchLocation = [touch locationInNode:_grid];
	if (touchLocation.x < 0 || touchLocation.y < 0 ||
		touchLocation.x > _grid.contentSize.width || touchLocation.y > _grid.contentSize.height) {
		self.touchIsOutOfBounds = YES;
	}else{
		self.touchIsOutOfBounds = NO;
	}
	NSLog(@"Touch location x: %f, y: %f", touchLocation.x, touchLocation.y);
	Cell *cell = [_grid cellForTouchLocation:touchLocation];
	if ([self canSelectCell:cell]) {
		cell.isSelected = YES;
		[self.selectedCells addObject:cell];
	}
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	
	if ([self canDeleteSelectedCells]) {
		[self destroyCells];
	}else{
		int delayCounter = 0;
		
		for (int i = (int)self.selectedCells.count - 1; i >= 0; i--) {
			delayCounter++;
			Cell *cell = self.selectedCells[i];
			CCActionFiniteTime *delay = [CCActionDelay actionWithDuration:0.1 * delayCounter];
			CCActionFiniteTime *deselect = [CCActionCallFunc actionWithTarget:cell selector:@selector(switchSelection)];
			CCActionSequence *sequence = [CCActionSequence actionOne:delay two:deselect];
			[cell runAction:sequence];
			self.userInteractionEnabled = YES;
		}
	}
//	self.userInteractionEnabled = YES;
	//TODO: Deselect all selected cells if no matches
	
	//TODO: Deselect all selected cells if touch ended not on the grid
	//TODO: Destroy all selected and matching cells
	
}

- (void)touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
	//TODO: Deselect all selected cells
	
}

- (void)destroyCells
{
	self.userInteractionEnabled = NO;
	int addedGold = 0;
	for (int i = (int)self.selectedCells.count - 1; i >= 0; i--) {
		Cell *cell = self.selectedCells[i];
		[_grid removeCell:cell];
		addedGold += [self goldForCell:cell];
	}
	NSArray *droppedCellsArray = [_grid dropCells];
	[_grid animateCellsDrop:droppedCellsArray completion:^{
		self.userInteractionEnabled = YES;
		self.gold += addedGold;
	}];
	self.completion += 5;
	//TODO: Count scores if cells matches
}

- (int)goldForCell:(Cell*)cell
{
	enum Materials material = cell.material;
	int price = self.goldForOneCell;
	if(material == MaterialRuby){
		price = price * 2;
	}else if (material == MaterialSilver){
		price = -self.goldForOneCell;
	}
	return price;
}

- (void)deselectCells:(NSArray*)cells
{
	
}

- (void)buyMaterials
{
	if (self.gold >= 100) {
		self.gold -= 100;
		[_grid animateNewCells:[_grid addNewCells] completion:^{
			NSLog(@"Added cells");
		}];
	}
	
}

- (void)setGold:(int)gold
{
	_gold = gold;
	[_goldLabel setString:[NSString stringWithFormat:@"%dAu", self.gold]];
}

- (void)setCompletion:(int)completion
{
	_completion = completion;
	[_completionLabel setString:[NSString stringWithFormat:@"%d", completion]];
}
//TODO: Destruction of connected cells
//TODO: Create word based on selected cells
//TODO: Add "required combinations" in top of the grid
//TODO: Match the word with required word from the top of the grid.

//TODO: Move cells down after destruction of some cells
//TODO Fill grid from top in the beginning of the game

@end
