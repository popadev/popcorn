//
//  MoviesViewModel.swift
//  Popcorn
//
//  Created by Petru Popa on 4/22/21.
//

import Foundation

class HomeViewModel: NSObject {
    
    private var apiService: APIService = APIService()
    private(set) var movies: Movies?
    private(set) var error: Error?
    
    var showResults: () -> () = {}
    
    override init() {
        super.init()
    }
    
    func searchMovies(query: String) {
        self.apiService.searchMovies(query: query) { (movies, error) in
            self.movies = movies
            self.error = error
            self.showResults()
        }
    }
    
}
