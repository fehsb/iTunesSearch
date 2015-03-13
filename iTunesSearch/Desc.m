//
//  Desc.m
//  iTunesSearch
//
//  Created by Fernando on 3/12/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "Desc.h"
#import "TableViewCell.h"

@interface Desc ()

@end

@implementation Desc
@synthesize imgDesc,nomeDesc,artistaDesc,m;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    artistaDesc.text = m.artista;
    nomeDesc.text = m.nome;
    [self carregaImagens:m.img];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) carregaImagens:(NSString *)url
{
    NSData * imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    imgDesc.image = image;
}

//
//-(void) update1:(Filme *)objeto{
//    [nomeDesc setText:objeto.nome];
//    [artistaDesc setText:objeto.artista];
//    [self carregaImagens:objeto.img];
//}
//
//-(void) update2:(Music *)objeto{
//    [nomeDesc setText:objeto.nome];
//    [artistaDesc setText:objeto.artista];
//    [self carregaImagens:objeto.img];
//}
//
//-(void) update0:(Podcasts *)objeto{
//    [nomeDesc setText:objeto.nome];
//    [artistaDesc setText:objeto.artista];
//    [self carregaImagens:objeto.img];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
