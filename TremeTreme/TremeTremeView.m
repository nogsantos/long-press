//
//  TremeTremeView.m
//  TremeTreme
//
//  Created by Fabricio Nogueira dos Santos on 9/16/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import "TremeTremeView.h"
#import "QuartzCore/QuartzCore.h"
/*
 * Definição de uma constante para converter graus para radianos.
 */
#define RADIANS(degrees) ((degrees * M_PI / 180.0)

@interface TremeTremeView ()

-(void) registraGestos;
-(void) enfeitaView;

@end

@implementation TremeTremeView
/**
 * Declaração do inicializador. 
 * Usado o método initiWithFrame ao invés de apenas init pelo fato de que
 * será será utilizado no controlador para criar instância desta view já especificando o seu tamanho.
 */
-(id) initWithFrame:(CGRect)frame{
    /*
     * Verifica se o frame foi inicializado
     */
    if((self = [super initWithFrame:frame])){
        /*
         * chamada para o style da view
         */
        [self enfeitaView];
        /*
         * chamada para o registrador dos gestos da view
         */
        [self registraGestos];
    }
    
    return self;
}
/**
 * Registra e define os gestos da view
 */
-(void) registraGestos{
//    /*
//     * Define o gesto de toque longo
//     */
//    UILongPressGestureRecognizer *toqueLongo = [[UILongPressGestureRecognizer alloc]
//                                                initWithTarget : self
//                                                action         : @selector(iniciaTremedeira)
//                                                ];
//    /*
//     * Registra a duração do toque para iniciar a ação.
//     */
//    toqueLongo.minimumPressDuration = 0.3;
//    [self addGestureRecognizer:toqueLongo];
    
    /*
     * Define o gestro de toque para iniciar, no caso, um toque duplo.
     */
    UITapGestureRecognizer *toqueLongo = [[UITapGestureRecognizer alloc]
                                          initWithTarget : self
                                          action         : @selector(iniciaTremedeira)
                                          ];
    /*
     * Registra a quantidade de toques
     */
    toqueLongo.numberOfTapsRequired = 2;
    [self addGestureRecognizer:toqueLongo];

//    /*
//     * Define o gestro de toque para parar, no caso, um toque duplo.
//     */
//    UITapGestureRecognizer *toqueParar = [[UITapGestureRecognizer alloc]
//                                          initWithTarget : self
//                                          action         : @selector(pararAnimacao)
//                                          ];
//    /*
//     * Registra a quantidade de toques
//     */
//    toqueParar.numberOfTapsRequired = 3;
//    [self addGestureRecognizer:toqueParar];
    
    /*
     * Define o gesto de toque longo
     */
    UILongPressGestureRecognizer *toqueParar = [[UILongPressGestureRecognizer alloc]
                                                    initWithTarget : self
                                                    action         : @selector(pararAnimacao)
                                                    ];
    /*
     * Registra a duração do toque para iniciar a ação.
     */
    toqueParar.minimumPressDuration = 0.3;
    [self addGestureRecognizer:toqueParar];
    
    
    
}
/**
 * O método depende da importação do QuartzCore para ter acesso a propriedade layer.
 * Define o style da view.
 */
-(void) enfeitaView{
    
    self.layer.masksToBounds = NO;
    self.layer.cornerRadius  = 8;
    self.layer.shadowOffset  = CGSizeMake(-2, 2);
    self.layer.shadowRadius  = 5;
    self.layer.shadowOpacity = 0.5;
}
/**
 * Método para iniciar a tremedeira
 */
-(void) iniciaTremedeira{
    /*
     * Confirma se deve iniciar o movimento
     */
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle     : @"Devo vibrar?"
                          message           : nil
                          delegate          : self
                          cancelButtonTitle : @"Não"
                          otherButtonTitles : @"Sim", nil];
    [alert show];
}
/**
 * Ação do tremeview
 */
-(void) doTremeView{
    /*
     * Faz a view girar rapidamente para a esquerda
     * Aplicação da propriedade transform da própria view
     */
    CGAffineTransform oscilaEsquerda = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(-5.0)));
    /*
     * Faz a view girar rapidamente para a direita
     * Aplicação da propriedade transform da própria view
     */
    CGAffineTransform oscilaDireita  = CGAffineTransformRotate(CGAffineTransformIdentity, RADIANS(5.0)));
    /*
     * Inicialização da oscilação a esquerda
     */
    self.transform = oscilaEsquerda;
    /*
     * Opções para a animção
     */
    UIViewAnimationOptions opcoes = UIViewAnimationOptionRepeat               |
    UIViewAnimationOptionAllowUserInteraction |
    UIViewAnimationOptionAutoreverse          |
    UIViewAnimationOptionCurveEaseInOut;
    /*
     * Cria e inicia a animação
     */
    [UIView
        animateWithDuration : 0.1
        delay               : 0
        options             : opcoes
        animations:^{
            self.transform = oscilaDireita;
        } completion:nil
     ];
}
/**
 * Método para parar a animação
 */
-(void) pararAnimacao {
    /*
     * Dispara outra animação que dura 0 segundos, que retorna a view para o estado normal.
     */
    UIViewAnimationOptions opcoes = UIViewAnimationOptionBeginFromCurrentState;
    [UIView
        animateWithDuration : 0
        delay               : 0
        options             : opcoes
        animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:nil
    ];
}
/**
 * Confirma
 */
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger) buttonIndex{
    
    if (buttonIndex == 1) {
        [self doTremeView];
    }
}
@end





















