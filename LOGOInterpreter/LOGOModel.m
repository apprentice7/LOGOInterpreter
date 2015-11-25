//
//  LOGOModel.m
//  LOGO Interpreter
//
//  Created by Chengpeng Qin on 16/3/15.
//  Copyright (c) 2015 Chengpeng Qin. All rights reserved.
//

#import "LOGOModel.h"


@implementation LOGOModel

- (void) setSourceCodeWithString: (NSString *)string{
    _sourceCode = [[SourceCode alloc] init];
    [_sourceCode SetString:string];
    //set source code with argument string
}

- (NSBezierPath *)executeLOGO{
    //execute the LOGO source code
    
    
    //Initialization for objects
    TokenList * List = [[TokenList alloc]init];
    SyntaxTreeNode* TreeNode = [[SyntaxTreeNode alloc]init];
    NSBezierPath *path = [[NSBezierPath alloc]init];
    NSMutableDictionary* MyDict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:nil];
    NSMutableArray* PathArr = [[NSMutableArray alloc]init];
    NSArray * SplitArray = [[NSArray alloc]init];
    List.array = [[NSMutableArray alloc]init];
    List.counting = 1;
    
    //Split input string into tokens
    SplitArray = [_sourceCode SplitArray];
    
    //Add tokens into tokenlist
    [List Add:SplitArray];
    
    //Get length of tokenlist
    List.LLEN = [SplitArray count];
    
    //Tokenlist parse itself from root and construct a syntax node tree
    TreeNode = [List Parse];
    
    //Syntax node tree evaluate itself from root
    [TreeNode Evaluate:MyDict:PathArr];
    
    //Set path
    Path * temp = [[Path alloc] init];
    [temp setCommand:PathArr];
    path = [temp path];
    
    return path;

}

@end
