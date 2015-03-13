//
//  ViewController.m
//  iTunesSearch
//
//  Created by joaquim on 09/03/15.
//  Copyright (c) 2015 joaquim. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "iTunesManager.h"
#import "Entidades/Filme.h"
#import "Entidades/Podcasts.h"
#import "Entidades/Music.h"

@interface TableViewController () {
    NSArray *midias;
}

@end

@implementation TableViewController

@synthesize search;

iTunesManager *itunes;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"celulaPadrao"];
    [search setDelegate:self];
    
    itunes = [iTunesManager sharedInstance];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Metodos do UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //NSUInteger qtd = midias.count;
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger i=0;
    if (section==0){
        i = [[midias objectAtIndex:0] count];
       
    }
    if (section==1){
        i = [[midias objectAtIndex:1] count];
       
    }
    if (section==2){
        i = [[midias objectAtIndex:2] count];
    }
  
    return i;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *celula = [self.tableview dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    

    
    if (indexPath.section == 0){
        
        Podcasts *podcast = [[midias objectAtIndex:0] objectAtIndex:indexPath.row];
        
        [celula.nome setText:podcast.nome];
        [celula.tipo setText:NSLocalizedString(podcast.tipo,nil)];
        [celula.artista setText:podcast.artista];
        [celula.pais setText:podcast.pais];
        [celula.duracao setText:[podcast.duracao stringValue]];
    }
    
    if (indexPath.section == 1){
        
        Filme *filme = [[midias objectAtIndex:1] objectAtIndex:indexPath.row];
        
        [celula.nome setText:filme.nome];
        [celula.tipo setText:NSLocalizedString(filme.tipo,nil)];
        [celula.artista setText:filme.artista];
        [celula.pais setText:filme.pais];
        [celula.duracao setText:[filme.duracao stringValue]];
    }
    
    if (indexPath.section == 2){
        
        Music *music = [[midias objectAtIndex:2] objectAtIndex:indexPath.row];
        
        [celula.nome setText:music.nome];
        [celula.tipo setText:NSLocalizedString(music.tipo,nil)];
        [celula.artista setText:music.artista];
        [celula.pais setText:music.pais];
        [celula.duracao setText:[music.duracao stringValue]];
    }
    
    
    return celula;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    
    switch (section)
    {
        case 0:
            sectionName =@"Podcast";
            break;
        case 1:
            sectionName = @"Movie";
            break;
        case 2:
            sectionName = @"Music";
            break;
        default:    
            sectionName = @"";
            break;
    }
    return sectionName;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    midias = [itunes buscarMidias:searchBar.text];
    [self.tableview reloadData];
    
}

- (IBAction)buscar:(id)sender {
    [self searchBarSearchButtonClicked:search];
}
@end
