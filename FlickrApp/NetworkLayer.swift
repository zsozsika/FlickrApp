//
//  NetworkLayer.swift
//  FlickrApp
//
//  Created by Kovács Zsóka on 2018. 05. 23..
//  Copyright © 2018. Kovács Zsóka. All rights reserved.
//

import Foundation
import Moya

let apiKey = "0c813bdd19b32fd70b03a38489160816"

enum FlickrServerAPI {
    case interestingness
    
    case latlon
    
    //tags
    case hotList
    case mostFrequentlyUsed
}

extension FlickrServerAPI: TargetType {
    
    var baseURL: URL { return URL(string: "https://api.flickr.com/services/rest/?method=")!}
    
    var path: String {
        switch self {
        case .interestingness:
                return "flickr.interestingness.getList&api_key=\(apiKey)"
        case .latlon:
                return "flickr.photos.search&api_key=\(apiKey)&lat=\(0)&lon=\(0)&radius=1&radius_units=mi&per_page=\(10)&format=json&nojsoncallback=1"
        case .hotList:
                return "flickr.tags.getHotList&api_key=\(apiKey)"
        case .mostFrequentlyUsed:
                return "flickr.tags.getMostFrequentlyUsedt&api_key=\(apiKey)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestData(Data())
    }
    
    var headers: [String : String]? {
        //?
        return nil
    }

}
