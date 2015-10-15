//
//  INVAudioSingleVC.m
//  MuzOn
//
//  Created by Ivan Novikov on 12.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioSingleVC.h"
#import "INVAudioSingleModel.h"
#import "CoreDataService.h"

@interface INVAudioSingleVC ()

@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;

- (IBAction)nextButtonTapped:(id)sender;
- (IBAction)prewButtonTapped:(id)sender;
- (IBAction)playButtonTapped:(id)sender;

- (IBAction)saveButtonPressed:(id)sender;

@end

@implementation INVAudioSingleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.model) {
        self.TitleLabel.text = self.model.titleAudio;
        self.artistLabel.text = self.model.artistAudio;
    }
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)nextButtonTapped:(id)sender {
}

- (IBAction)prewButtonTapped:(id)sender {
}

- (IBAction)playButtonTapped:(id)sender {
}

- (IBAction)saveButtonPressed:(id)sender {
    [CoreDataManager saveNewAudio:self.model];
}
@end
