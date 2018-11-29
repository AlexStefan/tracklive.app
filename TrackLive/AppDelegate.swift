//
//  AppDelegate.swift
//  TrackLive
//
//  Created by Alex Stefan on 31/08/2018.
//  Copyright © 2018 OrtecMobile. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(TrackLive.gms)

        // Fetch data every second.
        //UIApplication.shared.setMinimumBackgroundFetchInterval(1)

        return true
    }
    
//    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler:
//        @escaping (UIBackgroundFetchResult) -> Void) {
//        // Broadcast location to listeners
//    }
}
