//
//  RewardedVideoDelegate.swift
//  demoSupersonic
//
//  Created by Phung on 4/11/17.
//  Copyright © 2017 Phung. All rights reserved.
//

import UIKit

class RewardedVideoDelegate: UIViewController {

    
    var viewController: ViewController?
    var placementInfo: ISPlacementInfo?
    
    convenience init(viewControllers: ViewController) {
        self.init()
        
        DispatchQueue.main.async {
            self.viewController = viewControllers
        }
    }
    
    func rewardedVideoHasChangedAvailability(_ available: Bool) {
    
    }
    
    internal func didReceiveRewardForPlacement(placementInfo: ISPlacementInfo!) {
        self.placementInfo = placementInfo
        print("====================")
        
    }
}

extension RewardedVideoDelegate: ISRewardedVideoDelegate {
    
    /**
     Called after a rewarded video has finished playing.
     */
    public func rewardedVideoDidEnd() {
        //
    }
    
    /**
     Called after a rewarded video has started playing.
     */
    public func rewardedVideoDidStart() {
        //
        print("=======rewardedVideoDidStart=======")
    }
    
    /**
     Called after a rewarded video has been opened.
     */
    public func rewardedVideoDidOpen() {
         print("=======rewardedVideoDidOpen=======")
    }
    
    /**
     Called after a rewarded video has been dismissed.
     */
    public func rewardedVideoDidClose() {
        if (placementInfo != nil) {
            let alert = UIAlertView(title: "Video Reward", message: "You have been rewarded \(CInt((placementInfo?.rewardAmount)!)) \(placementInfo?.rewardName)", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
            alert.show()
            placementInfo = nil
        }
    }
    
    /**
     Called after a rewarded video has attempted to show but failed.
     
     @param error The reason for the error
     */
    public func rewardedVideoDidFailToShowWithError(_ error: Error!) {
        print("=======rewardedVideoDidFailToShowWithError=======")
    }
    
    /**
     Called after a rewarded video has been viewed completely and the user is eligible for reward.
     
     @param placementInfo An object that contains the placement's reward name and amount.
     */
    public func didReceiveReward(forPlacement placementInfo: ISPlacementInfo!) {
        print("=======didReceiveReward=======")
        self.placementInfo = placementInfo
        print(placementInfo)
        
    }
}
