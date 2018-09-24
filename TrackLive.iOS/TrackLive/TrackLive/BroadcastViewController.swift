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
    
    @IBOutlet weak var messageLabel: UILabel!
    override func loadView() {
        super.loadView()
        let ably = ARTRealtime(key: "DGcscA.BVxQBQ:UhzHEJqpIK2srvS3")
        /// Publish a message to the test channel
        let channel = ably.channels.get("test")
        self.messageLabel.text = ""
        
        channel.subscribe { message in
            self.messageLabel.text = "\(message.timestamp) \(message.data)"
        }
    }
    
    @IBAction func buttonTapped(button: UIButton){
        
        let ably = ARTRealtime(key: "DGcscA.BVxQBQ:UhzHEJqpIK2srvS3")
        /// Publish a message to the test channel
        let channel = ably.channels.get("test")
        channel.publish("greeting", data: "hello")

    }
}
