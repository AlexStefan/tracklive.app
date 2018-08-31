//
//  BroadcastViewController.swift
//  TrackLive
//
//  Created by Alex Stefan on 31/08/2018.
//  Copyright © 2018 OrtecMobile. All rights reserved.
//

import UIKit
import Ably

class BroadcastViewController: UIViewController {
    
    @IBAction func buttonTapped(button: UIButton){
        
        let ably = ARTRealtime(key: "")
        /// Publish a message to the test channel
        let channel = ably.channels.get("test")
        channel.publish("greeting", data: "hello")

    }
}
