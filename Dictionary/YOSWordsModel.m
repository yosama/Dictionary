//
//  YOSWordsModel.m
//  Padawans
//
//  Created by Yosnier on 16/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#import "YOSWordsModel.h"

@implementation YOSWordsModel


-(id) init {
    
    if (self = [super init]) {
        NSURL *urlToFile = [[NSBundle mainBundle] URLForResource:@"vocabwords"
                                                   withExtension:@"txt"];
        
        self.words = [NSDictionary dictionaryWithContentsOfURL:urlToFile];
    }
    return self;
}


#pragma mark - Utils

// Devuelve un NSArray ordenado de letras, Es decir, devuelve el alfabeto, de la a a la z.
-(NSArray *) letters{
    
    return [[self.words allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

//Devuelve la letra del alfabeto que está en la posición pedida. Es decir, si mandamos el mensaje letterAtIndex:0, nos
//devolverá una NSString con la letra a: @”a”.
-(NSString *) letterAtIndex: (NSInteger) aLetterIndex{
    return [[self letters] objectAtIndex:aLetterIndex];
}

//Devuelve la palabra que está en la posición aWordIndex dentro de la lista de
//palabras que empiezan por la letra que está en la posición aLetterIndex.
//Por ejemplo, si mandas el mensaje wordAtIndex:0 inLetterAtIndex:1 obtendrás la primera
//palabra que empieza por la b.
-(NSString *) wordAtIndex:(NSInteger) aWordIndex
          inLetterAtIndex:(NSInteger) aLetterIndex{
    
    NSString *letter = [self letterAtIndex:aLetterIndex];
    NSArray *wordsThatStartWithLetter = [self.words objectForKey:letter];
    return [wordsThatStartWithLetter objectAtIndex:aWordIndex];
}

//Devuelve un NSArray ordenado de palabras que empiezan por aquella letra que está en la posición pedida. Por ejemplo, si
// mandamos el mensaje wordsAtIndex:0, nos devolverá un array ordenado con todas aquellas palabras que empiezan por la a.
-(NSArray *) wordsAtIndex:(NSInteger)anIndex{
    NSString *letter = [[self letters] objectAtIndex:anIndex];
    return [[self.words objectForKey:letter] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}


@end
