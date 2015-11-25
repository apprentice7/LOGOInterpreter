//
//  TokenList.h
//  LOGOIP
//
//  Created by Kangkai on 7/4/15.
//  Copyright (c) 2015 Kangkai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"

@interface TokenList : NSObject
@property NSMutableArray* array;
@property int counting;
@property NSInteger LLEN;

//Add token into tokenlist
- (void)Add: (NSArray*)Arr;

//return a bool variable indicate if there is more token in tokenlist
- (BOOL)HasMoreTokens;

//return next token in the tokenlist
- (Token *)NextToken;

//Parse the tokenlist and output a syntaxtree root node
- (SyntaxTreeNode*) Parse;

@end

