//
//  ViewController.swift
//  demoSupersonic
//
//  Created by Phung on 4/11/17.
//  Copyright © 2017 Phung. All rights reserved.
//

import UIKit


let USERID = "demoapp"
let APPKEY = "437ae1ad"
class ViewController: UIViewController {

    weak var rvDelegate: ISRewardedVideoDelegate?
    
    @IBOutlet weak var pointLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //IronSource.setLogDelegate(a as! ISLogDelegate)
        ISIntegrationHelper.validateIntegration()
        ISSupersonicAdsConfiguration.configurations().useClientSideCallbacks = true
        IronSource.setUserId(USERID)
        IronSource.initWithAppKey(APPKEY)
        
        rvDelegate = RewardedVideoDelegate(viewControllers: self)
        IronSource.setRewardedVideoDelegate(rvDelegate!)
        
       

    }

    
    @IBAction func clickshowVideoReward(_ sender: Any) {
    
    IronSource.showRewardedVideo(with: self)
    
    }
    
    
}

