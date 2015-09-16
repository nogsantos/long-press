//
//  ViewController.m
//  TremeTreme
//
//  Created by Fabricio Nogueira dos Santos on 9/16/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import "ViewController.h"
#import "TremeTremeView.h"

@implementation ViewController
/**
 * Criação dos elementos na tela.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     * Cor de fundo
     */
    self.view.backgroundColor = [UIColor whiteColor];
    /*
     * Criação das views na tela.
     */
    [self criaTremeTremeView:CGPointMake(50, 80) comCor:[UIColor blackColor]];
    [self criaTremeTremeView:CGPointMake(200, 150) comCor:[UIColor blueColor]];
    [self criaTremeTremeView:CGPointMake(110, 250) comCor:[UIColor greenColor]];
    [self criaTremeTremeView:CGPointMake(40, 470) comCor:[UIColor purpleColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *
 */
-(void) criaTremeTremeView:(CGPoint) posicao comCor:(UIColor *) cor{
    /*
     *
     */
    CGRect r = CGRectMake(posicao.x, posicao.y, 60, 60);
    /*
     *
     */
    TremeTremeView *t = [[TremeTremeView alloc] initWithFrame:r];
    t.backgroundColor = cor;
    [self.view addSubview:t];
}

@end
