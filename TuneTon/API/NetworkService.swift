//
//  NetworkService.swift
//  TuneTon
//
//  Created by Artem Rodionov on 14.06.2024.
//

import UIKit
import Alamofire

final class NetworkService {
    
    
    func fetchTracks(searchText: String, completion: @escaping (SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search?term=\(searchText)"
            let parameters = [
                "term:":"\(searchText)",
                "limit":"10"
            ]
        AF.request(url, 
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
                return
            }
        
            guard let data = dataResponse.data else { return }
        
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                print("objects: ", objects)
                completion(objects)
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion(nil)
            }
//                let someString = String(data: data, encoding: .utf8)
//                print(someString ?? "")
        }
    }
}
