//
//  Cell.m
//  DwarfForgeJam
//
//  Created by Oleg on 22/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import "Cell.h"

@interface Cell()

@property (strong, nonatomic)NSArray *materialsAray;
@property (strong, nonatomic)CCSprite *image;

@property (strong, nonatomic)CCNodeColor *colorCell;


@end

@implementation Cell


- (instancetype)initWithMaterial:(enum Materials)material
{
	
	NSString *cellPath = [NSString stringWithFormat:@"%@", self.materialsAray[material]];
	self = (Cell*)[CCBReader load:cellPath];
	self.material = material;
	return self;
}

- (instancetype)init
{
	if (self = [super init])
	{
	
	}
	return self;
}

- (void)switchSelection
{
	self.isSelected = !self.isSelected;
}

- (void)destroy
{
//	self.image.visible = NO;
	CCParticleSystem *explosion = (CCParticleSystem*)[CCBReader load:@"CellExplosion"];
	explosion.positionType = CCPositionTypeNormalized;
	explosion.position = ccp(0.5, 0.5);
	[self addChild:explosion];
	
	CCActionSequence *deleteSequence = [CCActionSequence actionOne:[CCActionDelay actionWithDuration:0.3] two:[CCActionCallBlock actionWithBlock:^{
		[self removeFromParent];
	}]];
	[self runAction:deleteSequence];
}
- (void)setIsSelected:(BOOL)isSelected
{
	_isSelected = isSelected;
	CCActionFiniteTime *fadeAction;
	if (isSelected) {
		fadeAction = [CCActionFadeTo actionWithDuration:0.2 opacity:0.4];
	}else{
		fadeAction = [CCActionFadeTo actionWithDuration:0.2 opacity:0.0];
	}
	[[self getChildByName:@"highlight" recursively:NO] runAction:fadeAction];
}

- (NSArray *)materialsAray
{
	if (_materialsAray)
		return _materialsAray;
	
	_materialsAray = @[
					   @"CopperCell",
					   @"IronCell",
					   @"SilverCell",
					   @"GoldCell",
					   @"RubyCell",
					   @"DiamondCell"
					   ];
	return _materialsAray;
}
@end
