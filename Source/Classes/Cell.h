//
//  Cell.h
//  DwarfForgeJam
//
//  Created by Oleg on 22/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import "cocos2d.h"
#import "CellProtocol.h"

NS_ENUM(int, Materials){
	MaterialCopper,
	MaterialIron,
	MaterialSilver,
	MaterialGold,
	MaterialRuby,
	MaterialDiamond
};

@interface Cell : CCNode <CellProtocol>{
    
}
@property(assign, nonatomic)BOOL isSelected;

@property (strong, nonatomic) CCLabelTTF *symbol;

@property(assign, nonatomic)int cellWidth;
@property(assign, nonatomic)int cellHeight;

@property(assign, nonatomic)int column;
@property(assign, nonatomic)int row;
@property(assign, nonatomic)int material;

- (instancetype)initWithMaterial:(enum Materials)material;
- (void)switchSelection;
- (void)destroy;
@end
