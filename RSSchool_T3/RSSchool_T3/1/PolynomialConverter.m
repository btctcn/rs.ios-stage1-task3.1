#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    if(!numbers || numbers.count == 0) return nil;
    
    int powerMax = numbers.count - 1;
    NSMutableString * result = [NSMutableString new];
    for(int currentPower = powerMax, j = 0; currentPower >= 0; currentPower--, j++){
        int currentNumber = numbers[j].intValue;
        if(currentNumber == 0) continue;
        BOOL negative = currentNumber < 0;
        
        if(result.length == 0) {
            if(negative)
                [result appendString:@"-"];
        } else {
            [result appendString:(negative) ? @" - " : @" + "];
        }
        
        [result appendString:[NSString stringWithFormat:@"%@%@", [self convertNumToString:currentNumber], [self convertPowerToString:currentPower]]];
    }

    NSLog(@"%@", result);
    return  result;
}

-(NSString *) convertNumToString:(int) number{
    number = abs(number);
    if(number == 1) return @"";
    return [NSNumber numberWithInt:number].stringValue;
}

-(NSString *) convertPowerToString:(int)power{
    NSMutableString * result = [NSMutableString new];
    if(power > 1) return [NSString stringWithFormat:@"x^%@", @(power)];
    if(power == 1) return @"x";
    return @"";
}
@end
