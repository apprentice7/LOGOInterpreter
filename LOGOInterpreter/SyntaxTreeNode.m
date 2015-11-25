//
//  SyntaxTreeNode.m
//  LOGOIP
//
//  Created by Kangkai on 7/4/15.
//  Copyright (c) 2015 Kangkai. All rights reserved.
//

#import "SyntaxTreeNode.h"

@implementation SyntaxTreeNode
- (SyntaxTreeNode*)GetChild{
    return _Child;
}
- (SyntaxTreeNode*)GetSecChild{
    return _SecChild;
}
- (SyntaxTreeNode*)GetThirdChild{
    return _ThirdChild;
}
-(void)SetNumber:(long) num{
    _Number = num;
}
-(void)SetName:(NSString*) name{
    _VARName = name;
}
-(long)GetNumber{
    return _Number;
}

-(NSMutableArray*)Evaluate: (NSMutableDictionary*)Dict :(NSMutableArray*)PathArr{
    return PathArr;
    ;
}
@end

//Node without number
@implementation CSNode
-(void)Evaluate: (NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    //printf("Clear screen\n");
    [PathArr addObject:@"CS"];
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation PDNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    //printf("Pen down.\n");
    [PathArr addObject:@"PD"];
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation PUNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    //printf("Pen up.\n");
    [PathArr addObject:@"PU"];
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

//Node with number or variable
@implementation FDNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    long Value; //store the steps value
    NSString* Var=[self GetChild].VARName;
    if (![MyDict objectForKey:Var]) {
        Value =[self GetChild].Number;
        //printf("Move turtle %ld steps forward.\n", Value);
        NSString * Steps = [NSString stringWithFormat:@"%ld",Value];
        [PathArr addObject:@"FD"];
        [PathArr addObject:Steps];
    }
    else{
        NSString *VariableValue = [MyDict objectForKey:Var];
        Value = [VariableValue integerValue];
        //printf("Move turtle %ld steps forward.\n", Value);
        NSString * Steps = [NSString stringWithFormat:@"%ld",Value];
        [PathArr addObject:@"FD"];
        [PathArr addObject:Steps];
    }
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation BKNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    long Value; //store the steps value
    NSString* Var=[self GetChild].VARName;
    if (![MyDict objectForKey:Var]) {
        Value =[self GetChild].Number;
        //printf("Move turtle %zd steps backward.\n", Value);
        NSString * Steps = [NSString stringWithFormat:@"%ld",Value];
        [PathArr addObject:@"BK"];
        [PathArr addObject:Steps];
    }
    else{
        NSString *VariableValue = [MyDict objectForKey:Var];
        Value = [VariableValue integerValue];
        //printf("Move turtle %zd steps backward.\n", Value);
        NSString * Steps = [NSString stringWithFormat:@"%ld",Value];
        [PathArr addObject:@"BK"];
        [PathArr addObject:Steps];
    }
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation RTNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    long Value; //store the variable value
    NSString* Var=[self GetChild].VARName;
    if (![MyDict objectForKey:Var]) {
        Value =[self GetChild].Number;
        //printf("Turn turtle %zd degrees right.\n", Value);
        NSString * Steps = [NSString stringWithFormat:@"%ld",Value];
        [PathArr addObject:@"RT"];
        [PathArr addObject:Steps];
    }
    else{
        NSString *VariableValue = [MyDict objectForKey:Var];
        Value = [VariableValue integerValue];
        //printf("Turn turtle %zd degrees right.\n", Value);
        NSString * Steps = [NSString stringWithFormat:@"%ld",Value];
        [PathArr addObject:@"RT"];
        [PathArr addObject:Steps];
    }
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation LTNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    long Value; //store the variable value
    NSString* Var=[self GetChild].VARName;
    if (![MyDict objectForKey:Var]) {
        Value =[self GetChild].Number;
        //printf("Turn turtle %zd degrees left.\n", Value);
        NSString * Steps = [NSString stringWithFormat:@"%ld",Value];
        [PathArr addObject:@"LT"];
        [PathArr addObject:Steps];
    }
    else{
        NSString *VariableValue = [MyDict objectForKey:Var];
        Value = [VariableValue integerValue];
        //printf("Turn turtle %zd degrees left.\n", Value);
        NSString * Steps = [NSString stringWithFormat:@"%ld",Value];
        [PathArr addObject:@"LT"];
        [PathArr addObject:Steps];
    }
    
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation REPEATNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    long Value; //store the variable value
    int i = 0;
    NSString* Var=[self GetSecChild].VARName;
    if (![MyDict objectForKey:Var]) {
        Value =[self GetSecChild].Number;
    }
    else{
        NSString *VariableValue = [MyDict objectForKey:Var];
        Value = [VariableValue integerValue];
    }
    while (i < Value) {
        [[[self GetSecChild]GetChild] Evaluate:MyDict:PathArr];
        i++;
        if (![MyDict objectForKey:Var]) {
            Value =[self GetSecChild].Number;
        }
        else{
            NSString *VariableValue = [MyDict objectForKey:Var];
            Value = [VariableValue integerValue];
        }

    }
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation MAKENode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    NSString* Var=[self GetChild].VARName;
    [MyDict setObject:@"0" forKey:Var];
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation VARNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation SETNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    NSString* Var=[self GetChild].VARName;
    if (![MyDict objectForKey:Var]) {
        printf("Variable Not Declare!\n");
    }
    else{
        [MyDict removeObjectForKey:Var];
        long value = [[[self GetChild]GetChild] GetNumber];
        NSString* Value = [NSString stringWithFormat:@"%ld",value];
        [MyDict setObject:Value forKey:Var];
    }
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation ADDNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    long Variable1; //variable 1 to be added
    long Variable2; //variable 2 to be added
    NSString* Value = [[NSString alloc]init]; //Dest variable value to be add to Dictionary
    NSString* Dest=[self GetChild].VARName;
    if (![MyDict objectForKey:Dest]) {
        printf("Variable Not Declare!\n");
    }
    else{
        NSString* Var1=[[self GetChild]GetChild].VARName;
        NSString* Var2=[[[self GetChild]GetChild]GetChild].VARName;
        
        //Find value for first variable
        if ([MyDict objectForKey:Var1]) {
            NSString * value1 = [MyDict objectForKey:Var1];
            Variable1 = [value1 integerValue];
        }
        else{
            printf("Variable Not Declare!\n");
        }
        //Find value for second variable
        if ([MyDict objectForKey:Var2]) {
            NSString * value2 = [MyDict objectForKey:Var2];
            Variable2 = [value2 integerValue];
        }
        else if ([Var2 isEqualToString:@"number"]){
            Variable2 = [[[[self GetChild]GetChild]GetChild] GetNumber];
        }
        else{
            printf("Error Input!\n");
        }
        
        //Set value to Dest variable
        Variable1 = Variable1 + Variable2;
        Value = [NSString stringWithFormat:@"%ld",Variable1];
        [MyDict removeObjectForKey:Dest];
        [MyDict setObject:Value forKey:Dest];
    }
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation SUBNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    long Variable1; //variable 1 to be added
    long Variable2; //variable 2 to be added
    NSString* Value = [[NSString alloc]init]; //Dest variable value to be add to Dictionary
    NSString* Dest=[self GetChild].VARName;
    if (![MyDict objectForKey:Dest]) {
        printf("Variable Not Declare!\n");
    }
    else{
        NSString* Var1=[[self GetChild]GetChild].VARName;
        NSString* Var2=[[[self GetChild]GetChild]GetChild].VARName;
        
        //Find value for first variable
        if ([MyDict objectForKey:Var1]) {
            NSString * value1 = [MyDict objectForKey:Var1];
            Variable1 = [value1 integerValue];
        }
        else{
            printf("Variable Not Declare!\n");
        }
        //Find value for second variable
        if ([MyDict objectForKey:Var2]) {
            NSString * value2 = [MyDict objectForKey:Var2];
            Variable2 = [value2 integerValue];
        }
        else if ([Var2 isEqualToString:@"number"]){
            Variable2 = [[[[self GetChild]GetChild]GetChild] GetNumber];
        }
        else{
            printf("Error Input!\n");
        }
        
        //Set value to Dest variable
        Variable1 = Variable1 - Variable2;
        Value = [NSString stringWithFormat:@"%ld",Variable1];
        [MyDict removeObjectForKey:Dest];
        [MyDict setObject:Value forKey:Dest];
    }
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation WHILENode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    long CompareValue1 = 0;
    long CompareValue2 = 0;
    NSString* Var=[[self GetThirdChild]GetChild].VARName; //EQ/GT/ST
    NSString* WVar1=[[[self GetThirdChild]GetChild]GetChild].VARName; //Var1
    NSString* WVar2=[[[[self GetThirdChild]GetChild]GetChild]GetChild].VARName; //Var2
    
    if ([Var isEqualToString:@"EQ"]) {
        //Find the value of Variable 1 & 2
        if (![MyDict objectForKey:WVar1]) {
            NSString *VariableValue = [MyDict objectForKey:WVar1];
            CompareValue1 = [VariableValue integerValue];
        }
        else{
            NSString *VariableValue = [MyDict objectForKey:WVar1];
            CompareValue1 = [VariableValue integerValue];
        }
        if (![MyDict objectForKey:WVar2]){
            CompareValue2 = [[[[[self GetThirdChild]GetChild]GetChild]GetChild] GetNumber];
        }
        else {
            NSString *VariableValue = [MyDict objectForKey:WVar2];
            CompareValue2 = [VariableValue integerValue];
        }
        while (CompareValue1 == CompareValue2) {
            [[self GetSecChild] Evaluate:MyDict:PathArr];
            if (![MyDict objectForKey:WVar1]) {
                NSString *VariableValue = [MyDict objectForKey:WVar1];
                CompareValue1 = [VariableValue integerValue];
            }
            else{
                NSString *VariableValue = [MyDict objectForKey:WVar1];
                CompareValue1 = [VariableValue integerValue];
            }
            if (![MyDict objectForKey:WVar2]){
                CompareValue2 = [[[[[self GetThirdChild]GetChild]GetChild]GetChild] GetNumber];
            }
            else {
                NSString *VariableValue = [MyDict objectForKey:WVar2];
                CompareValue2 = [VariableValue integerValue];
            }
        }
        [[self GetChild] Evaluate:MyDict:PathArr];
    }
    
    else if ([Var isEqualToString:@"GT"]){
        //Find the value of Variable 1 & 2
        if (![MyDict objectForKey:WVar1]) {
            NSString *VariableValue = [MyDict objectForKey:WVar1];
            CompareValue1 = [VariableValue integerValue];
        }
        else{
            NSString *VariableValue = [MyDict objectForKey:WVar1];
            CompareValue1 = [VariableValue integerValue];
        }
        if (![MyDict objectForKey:WVar2]){
            CompareValue2 = [[[[[self GetThirdChild]GetChild]GetChild]GetChild] GetNumber];
        }
        else {
            NSString *VariableValue = [MyDict objectForKey:WVar2];
            CompareValue2 = [VariableValue integerValue];
        }
        while (CompareValue1 >= CompareValue2) {
            [[self GetSecChild] Evaluate:MyDict:PathArr];
            if (![MyDict objectForKey:WVar1]) {
                NSString *VariableValue = [MyDict objectForKey:WVar1];
                CompareValue1 = [VariableValue integerValue];
            }
            else{
                NSString *VariableValue = [MyDict objectForKey:WVar1];
                CompareValue1 = [VariableValue integerValue];
            }
            if (![MyDict objectForKey:WVar2]){
                CompareValue2 = [[[[[self GetThirdChild]GetChild]GetChild]GetChild] GetNumber];
            }
            else {
                NSString *VariableValue = [MyDict objectForKey:WVar2];
                CompareValue2 = [VariableValue integerValue];
            }
        }
        [[self GetChild] Evaluate:MyDict:PathArr];
    }
    
    else if ([Var isEqualToString:@"ST"]){
        //Find the value of Variable 1 & 2
        if (![MyDict objectForKey:WVar1]) {
            NSString *VariableValue = [MyDict objectForKey:WVar1];
            CompareValue1 = [VariableValue integerValue];
        }
        else{
            NSString *VariableValue = [MyDict objectForKey:WVar1];
            CompareValue1 = [VariableValue integerValue];
        }
        if (![MyDict objectForKey:WVar2]){
            CompareValue2 = [[[[[self GetThirdChild]GetChild]GetChild]GetChild] GetNumber];
        }
        else {
            NSString *VariableValue = [MyDict objectForKey:WVar2];
            CompareValue2 = [VariableValue integerValue];
        }
        while (CompareValue1 <= CompareValue2) {
            [[self GetSecChild] Evaluate:MyDict:PathArr];
            if (![MyDict objectForKey:WVar1]) {
                NSString *VariableValue = [MyDict objectForKey:WVar1];
                CompareValue1 = [VariableValue integerValue];
            }
            else{
                NSString *VariableValue = [MyDict objectForKey:WVar1];
                CompareValue1 = [VariableValue integerValue];
            }
            if (![MyDict objectForKey:WVar2]){
                CompareValue2 = [[[[[self GetThirdChild]GetChild]GetChild]GetChild] GetNumber];
            }
            else {
                NSString *VariableValue = [MyDict objectForKey:WVar2];
                CompareValue2 = [VariableValue integerValue];
            }
        }
        [[self GetChild] Evaluate:MyDict:PathArr];
    }
}
@end

@implementation EQNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation GTNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation STNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation NUMNode
-(void)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    [[self GetChild] Evaluate:MyDict:PathArr];
}
@end

@implementation STARNode
-(NSMutableArray*)Evaluate:(NSMutableDictionary*) MyDict :(NSMutableArray*)PathArr{
    return PathArr;
}
@end
