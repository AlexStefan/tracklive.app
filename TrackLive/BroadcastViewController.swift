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
        let ably = ARTRealtime(key: TrackLive.art)
        /// Publish a message to the test channel
        let channel = ably.channels.get("test")
        self.messageLabel.text = ""
        
        channel.subscribe { message in
            self.messageLabel.text = "\(message.timestamp) \(message.data ?? "")"
        }
    }
    
    @IBAction func buttonTapped(button: UIButton){
        let com = CommunicationService.init()
        com.GetTrackingCodeLocation(code: "5629499534213120") { result in
            DispatchQueue.main.async {
                self.messageLabel.text = result
            }
        }
//        let ably = ARTRealtime(key: TrackLive.art)
//        /// Publish a message to the test channel
//        let channel = ably.channels.get("test")
//        channel.publish("greeting", data: "hello")
    }
}
