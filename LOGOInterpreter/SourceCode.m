//
//  SourceCode.m
//  LOGOIP
//
//  Created by Kangkai on 12/4/15.
//  Copyright (c) 2015 Kangkai. All rights reserved.
//

#import "SourceCode.h"

@implementation SourceCode

- (void)SetString: (NSString*)String{
    _SourceString = String;
}

- (NSArray*)SplitArray{
    //Split the input string into array elements
    //And check the syntax
    NSString * StrToProcess = [[NSString alloc]init];
    NSString * StrProcess = [[NSString alloc]init];
    NSArray* SplitArray = [[NSArray alloc]init];
    
    StrToProcess = _SourceString;
    
    NSString * newString = [StrToProcess stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    StrToProcess = newString;
    
    NSUInteger length = [StrToProcess length];
    for (int i = 0; i < length - 1; i++) {
        char Ch = [StrToProcess characterAtIndex:i];
        char ChP = [StrToProcess characterAtIndex:i+1];
        if(Ch != ' ' && Ch != '[' && Ch != ']'){
            if (Ch >= '0' & Ch <= '9') {
                if (ChP == '[' || ChP == ']') {
                    StrProcess = [StrProcess stringByAppendingFormat:@"%c", Ch];
                    StrProcess = [StrProcess stringByAppendingString:@" "];
                }
                else{
                    StrProcess = [StrProcess stringByAppendingFormat:@"%c", Ch];
                }
            }
            else if(Ch >= 'A' && Ch <= 'Z'){
                if (ChP == '[' || ChP == ']') {
                    StrProcess = [StrProcess stringByAppendingFormat:@"%c", Ch];
                    StrProcess = [StrProcess stringByAppendingString:@" "];
                }
                else{
                    StrProcess = [StrProcess stringByAppendingFormat:@"%c", Ch];
                }
            }
            else{
                printf("Input Argument Error.\n");
                printf("Grammar:\n");
                printf("start -> <command> | <command> <command>\n");
                printf("<command> -> CS | PU | PD | FD <constant> | BK <constant> | LT <consatnt> | RT <constant> | REPEAT <constant> [<command>]\n");
                printf("<constant> -> positive integer\n");
                exit(0);
            }
        }
        else if(Ch == ' '){
            StrProcess = [StrProcess stringByAppendingString:@" "];
        }
        else if(Ch == '['){
            StrProcess = [StrProcess stringByAppendingString:@"["];
            StrProcess = [StrProcess stringByAppendingString:@" "];
        }
        else if (Ch == ']'){
            StrProcess = [StrProcess stringByAppendingString:@"]"];
            StrProcess = [StrProcess stringByAppendingString:@" "];
        }
    }
    char LastChar = [StrToProcess characterAtIndex:length-1];
    StrProcess = [StrProcess stringByAppendingFormat:@"%c",LastChar];
    StrProcess = [StrProcess stringByAppendingString:@" "];
    StrProcess = [StrProcess stringByAppendingString:@"*"];
    SplitArray = [StrProcess componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    SplitArray = [SplitArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF !=''"]];
    
    return SplitArray;
}
@end
