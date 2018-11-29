//
//  CommunicationService.swift
//  TrackLive
//
//  Created by Alex Stefan on 28/09/2018.
//  Copyright © 2018 OrtecMobile. All rights reserved.
//

import Foundation

class CommunicationService
{
    open func GetTrackingCodeLocation(code: String, completion: @escaping (String)->()) {
        let url = URL(string: "\(TrackLive.url)trackings/\(code)")!
        var resultData = ""
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            resultData = String(data: data, encoding: .utf8)!
            completion(resultData);
        }
    }
}
