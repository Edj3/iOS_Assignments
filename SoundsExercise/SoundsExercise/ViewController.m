//
//  ViewController.m
//  SoundsExercise
//
//  Created by Unbounded on 4/24/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    MPMoviePlayerController *myPlayer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createMusicPlayer];
    
}

-(void)movieFinishedCallBack:(NSNotification*)aNotification{
    MPMoviePlayerController *moviePlayer = [aNotification object];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
    [moviePlayer.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createMusicPlayer{
    NSString *url = [[NSBundle mainBundle] pathForResource:@"movie" ofType:@"mp4"];
    myPlayer = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL fileURLWithPath:url]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieFinishedCallBack:) name:MPMoviePlayerPlaybackDidFinishNotification object:myPlayer];
    
    myPlayer.view.frame = CGRectMake(10, 10, 300, 300);
    [self.view addSubview:myPlayer.view
     ];
    //play movie
    [myPlayer play];
    
    //create buttons for playlist
//    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [playButton setFrame:CGRectMake(100, 300, 100, 100)];
//    [playButton setTitle:@"Play Song" forState:UIControlStateNormal];
//    [playButton addTarget:self action:@selector(playPodMusic) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:playButton];
}

//-(void)playPodMusic{
//    //instanitate a music player
//    MPMusicPlayerController *appPlayer = [MPMusicPlayerController applicationMusicPlayer];
//    [appPlayer setShuffleMode:MPMusicShuffleModeSongs];
//    BOOL playlistFound = NO;
//    MPMediaQuery *playlistsQuery = [MPMediaQuery playlistsQuery];
//    
//}
@end
