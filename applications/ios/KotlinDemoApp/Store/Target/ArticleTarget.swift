//
//  ArticleTarget.swift
//  Store
//
//  Created by Daniele Boscolo on 26/03/18.
//  Copyright © 2018 Tokenlab. All rights reserved.
//

import Foundation
import Common
import Moya
import RxMoya
import RxSwift

enum ArticleTarget {
    case topArticles(country: String, category: String)
}

extension ArticleTarget: TargetType {
    // https://newsapi.org/v2/top-headlines?apiKey=032be3c3d700450c90c5ae280dd06576&country=us
    
    var apiKey: String { return "032be3c3d700450c90c5ae280dd06576" }
    
    var baseURL: URL { return URL(string: "https://newsapi.org/v2/")! }
    
    var path: String {
        switch self {
        case .topArticles: return "top-headlines"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .topArticles: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .topArticles(let country, let category):
            return .requestParameters(parameters: ["apiKey": apiKey, "country": country, "category": category], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? { return nil }
    
    var sampleData: Data { return Data() }
}
