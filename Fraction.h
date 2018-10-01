//
//  Fraction.h
//  FractionCalculator
//
//  Created by jfang19 on 9/21/18.
//  Copyright © 2018 joshuafang. All rights reserved.
//

#ifndef Fraction_h
#define Fraction_h

@interface Fraction: NSObject

@property int numerator;
@property int denominator;

-(id) initWithNumerator: (int) numerator andDenominator: (int) denominator;
-(Fraction *) opposite;
-(Fraction *) reciprocal;
-(void) print;
-(void) simplify;
-(BOOL) isValid;
-(double) value;
-(NSString *) display;

@end

#endif /* Fraction_h */
