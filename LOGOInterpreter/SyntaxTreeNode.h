//
//  SyntaxTreeNode.h
//  LOGOIP
//
//  Created by Kangkai on 7/4/15.
//  Copyright (c) 2015 Kangkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SyntaxTreeNode : NSObject
@property long Number;
@property NSString* VARName;
@property SyntaxTreeNode* Child;
@property SyntaxTreeNode* SecChild;
@property SyntaxTreeNode* ThirdChild;

//Get next child in the syntax tree
- (SyntaxTreeNode*)GetChild;

//Get Second child in the syntax tree
- (SyntaxTreeNode*)GetSecChild;

//Get Third child in the syntax tree
- (SyntaxTreeNode*)GetThirdChild;

-(void)SetNumber:(long) num;

-(long)GetNumber;

-(void)SetName: (NSString*) name;

- (NSMutableArray*)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;

@end

//Node without number: evaluate it directly and iteratively evaluate next node
@interface CSNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

@interface PUNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

@interface PDNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

//Node with number: get value be dictionary or next node
@interface FDNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

@interface BKNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

@interface LTNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

@interface RTNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

//Repeat node: recursively evaluate the second child for variable times
@interface REPEATNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

//Initialize variable with 0 value to dictionary
@interface MAKENode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

//Simply evaluate next node
@interface VARNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

//Set next node with value of the one next to next node
@interface SETNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

//Add variable 1 and 2 and assign value to destinated variable
@interface ADDNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

//Subtract variable 1 and 2 and assign value to destinated variable
@interface SUBNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

//Depend on the condition in third child,
//decide whether continue evaluating the second child
@interface WHILENode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

//Conditional nodes: Evaluate next node
@interface EQNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

@interface GTNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

@interface STNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

//Number nodes: Evaluate next node
@interface NUMNode : SyntaxTreeNode
- (void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end

//Stop and return the array path
@interface STARNode : SyntaxTreeNode
- (NSMutableArray*)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr;
@end
