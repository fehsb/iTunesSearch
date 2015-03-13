//
//  Desc.h
//  iTunesSearch
//
//  Created by Fernando on 3/12/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Filme.h"
#import "Music.h"
#import "Podcasts.h"

@interface Desc : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgDesc;
@property (weak, nonatomic) IBOutlet UILabel *nomeDesc;
@property (weak, nonatomic) IBOutlet UILabel *artistaDesc;

@property Mae *m;




-(void) carregaImagens:(NSString *)url;
@end
