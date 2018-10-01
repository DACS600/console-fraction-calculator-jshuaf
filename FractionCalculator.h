//
//  FractionCalculator.h
//  FractionCalculator
//
//  Created by jfang19 on 9/21/18.
//  Copyright © 2018 joshuafang. All rights reserved.
//

#ifndef FractionCalculator_h
#define FractionCalculator_h
#import "Fraction.h"

@interface FractionCalculator: NSObject

enum Operation {Add = 43, Subtract = 45, Multiply = 42, Divide = 47};

@property Fraction *fraction1;
@property Fraction *fraction2;
@property Fraction *resultFraction;
@property NSString *numerator1;
@property enum Operation operation;

-(Fraction *) addFractions: (Fraction *) fraction1 : (Fraction *) fraction2;
-(Fraction *) subtractFractions: (Fraction *) fraction1 : (Fraction *) fraction2;
-(Fraction *) multiplyFractions: (Fraction *) fraction1 : (Fraction *) fraction2;
-(Fraction *) divideFractions: (Fraction *) fraction1 : (Fraction *) fraction2;

-(void) performOperation;
-(NSString *) display;
-(void) run;

@end


#endif /* FractionCalculator_h */
