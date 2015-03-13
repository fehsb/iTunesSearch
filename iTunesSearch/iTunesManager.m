//
//  iTunesManager.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "iTunesManager.h"
#import "Entidades/Filme.h"
#import "Entidades/Music.h"
#import "Entidades/Podcasts.h"



NSMutableArray *sect;

@implementation iTunesManager

static iTunesManager *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];    
    });
    
    return SINGLETON;
}


- (NSArray *)buscarMidias:(NSString *)termo {
    if (!termo) {
        termo = @"";
    }
    
    NSString *url = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@&media=all", termo];
    NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
    
    NSError *error;
    NSDictionary *resultado = [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:NSJSONReadingMutableContainers
                                                                error:&error];
    if (error) {
        NSLog(@"Não foi possível fazer a busca. ERRO: %@", error);
        return nil;
    }
    
    NSArray *resultados = [resultado objectForKey:@"results"];
    NSMutableArray *filmes = [[NSMutableArray alloc] init];
    NSMutableArray *musicas = [[NSMutableArray alloc]init];
    NSMutableArray *podcasts = [[NSMutableArray alloc]init];
       
    for (NSDictionary *item in resultados) {
        
        NSString *tipo = [item objectForKey:@"kind"];
        
        if ([tipo isEqualToString: @"feature-movie"]){
                
                Filme *filme = [[Filme alloc] init];
                [filme setNome:[item objectForKey:@"trackName"]];
                [filme setTrackId:[item objectForKey:@"trackId"]];
                [filme setArtista:[item objectForKey:@"artistName"]];
                [filme setDuracao:[item objectForKey:@"trackTimeMillis"]];
                [filme setGenero:[item objectForKey:@"primaryGenreName"]];
                [filme setPais:[item objectForKey:@"country"]];
                [filme setTipo:[item objectForKey:@"kind"]];
                [filme setImg:[item objectForKey:@"artworkUrl100"]];
                [filmes addObject:filme];
            
        }
        if ([tipo isEqualToString: @"song"]){
            
            Music *musica = [[Music alloc] init];
            [musica setNome:[item objectForKey:@"trackName"]];
            [musica setTrackId:[item objectForKey:@"trackId"]];
            [musica setArtista:[item objectForKey:@"artistName"]];
            [musica setDuracao:[item objectForKey:@"trackTimeMillis"]];
            [musica setGenero:[item objectForKey:@"primaryGenreName"]];
            [musica setPais:[item objectForKey:@"country"]];
            [musica setTipo:[item objectForKey:@"kind"]];
            [musica setImg:[item objectForKey:@"artworkUrl100"]];
            [musicas addObject:musica];
            
        }
 
        if ([tipo isEqualToString: @"podcast"]){
            
            Podcasts *podcast = [[Podcasts alloc] init];
            [podcast setNome:[item objectForKey:@"trackName"]];
            [podcast setTrackId:[item objectForKey:@"trackId"]];
            [podcast setArtista:[item objectForKey:@"artistName"]];
            [podcast setDuracao:[item objectForKey:@"trackTimeMillis"]];
            [podcast setGenero:[item objectForKey:@"primaryGenreName"]];
            [podcast setPais:[item objectForKey:@"country"]];
            [podcast setTipo:[item objectForKey:@"kind"]];
            [podcast setImg:[item objectForKey:@"artworkUrl100"]];
            [podcasts addObject:podcast];
            
        }
        
    }
    
    
    NSArray *midiasArray = [[NSArray alloc]initWithObjects:podcasts,filmes,musicas, nil];
        return midiasArray;
}




#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[iTunesManager alloc] init];
}

- (id)mutableCopy
{
    return [[iTunesManager alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}


@end
