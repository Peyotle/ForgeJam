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
@property(assign, nonatomic)enum Materials materialNumber;
@property(assign, nonatomic)BOOL isSelected;


@property (strong, nonatomic)CCNodeColor *colorCell;
@end

@implementation Cell


- (instancetype)initWithMaterial:(enum Materials)material
{
	self.materialNumber = material;
	
	NSString *cellPath = [NSString stringWithFormat:@"%@", self.materialsAray[material]];
	self = (Cell*)[CCBReader load:cellPath];
	
	return self;
}

- (instancetype)init
{
	if (self = [super init])
	{
		
	}
	return self;
}

- (void)setMaterialNumber:(enum Materials)materialNumber
{
	_materialNumber = materialNumber;
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
