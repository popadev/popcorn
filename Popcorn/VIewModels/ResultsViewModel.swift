//
//  ResultsViewModel.swift
//  Popcorn
//
//  Created by Petru Popa on 4/23/21.
//

import Foundation

class ResultsViewModel: NSObject {
    
    var query: String
    var movies: Movies
    
    public init(query: String, movies: Movies) {
        self.query = query
        self.movies = movies
    }
    
}
