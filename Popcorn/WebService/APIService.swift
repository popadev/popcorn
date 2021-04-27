//
//  APIService.swift
//  Popcorn
//
//  Created by Petru Popa on 4/22/21.
//

import Foundation
import Alamofire

class APIService: NSObject {
    
    private let searchUrl = "https://api.themoviedb.org/3/search/movie"
    
    func searchMovies(query: String, completion: @escaping (Movies?, Error?) -> ()) {
        let params = [
            "api_key": "2696829a81b1b5827d515ff121700838",
            "query": query
        ]
        
        AF.request(searchUrl, method: .get, parameters: params).responseDecodable(of: Movies.self) { (response) in
            switch response.result {
            case .success(let movies):
                completion(movies, nil)
                break
            case .failure(let error):
                completion(nil, error)
                break
            }
        }
    }
}
