//
//  Cell.h
//  DwarfForgeJam
//
//  Created by Oleg on 22/08/14.
//  Copyright 2014 Peyotle. All rights reserved.
//

#import "cocos2d.h"

NS_ENUM(int, Materials){
	MaterialCopper,
	MaterialIron,
	MaterialSilver,
	MaterialGold,
	MaterialRuby,
	MaterialDiamond
};

@interface Cell : CCNode {
    
}

@property (strong, nonatomic) CCLabelTTF *symbol;

@property(assign, nonatomic)int cellWidth;
@property(assign, nonatomic)int cellHeight;

- (instancetype)initWithMaterial:(enum Materials)material;

@end
