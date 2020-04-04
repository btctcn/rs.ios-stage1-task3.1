#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    int posters = array[0].intValue;
    int colorsCount = array[1].intValue;
    
    for(int groupCount = 1; groupCount < colorsCount; groupCount++){
        long combinations = [self getBinCoefByN:colorsCount andK:groupCount];
        if(combinations >= posters){
            return @(groupCount);
        }
    }
    
    return nil;
}

-(long)getBinCoefByN:(long) N andK:(long)K{
    long r = 1;
    long d;
    if (K > N) return 0;
    for (d = 1; d <= K; d++)
    {
        r *= N--;
        r /= d;
    }
    return r;
}
@end
