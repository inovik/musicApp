//
//  INVMenuScreen.m
//  MuzOn
//
//  Created by Ivan Novikov on 06.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVMenuScreen.h"
#import "INVVKManager.h"
#import <VK-ios-sdk/VKResponse.h>
#import "INVAudioListVC.h"

@interface INVMenuScreen()

@end

@implementation INVMenuScreen


-(void)viewDidLoad{
    [super viewDidLoad];
    //need init viewController model
    [VKManager autorizateVKSDK];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[INVAudioListVC class]] ){

        INVAudioListVC *vc = segue.destinationViewController;
        
        if ( [segue.identifier isEqualToString:AudioFromDBSegueID] )
        {
            vc.loadingType = LoadingTypeFromDB;
        }else if ([segue.identifier isEqualToString:AudioFromServerSegueID]){
            vc.loadingType = LoadingTypeFromServer;
        }
    }

}


@end
