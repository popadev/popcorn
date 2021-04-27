//
//  DetailViewModel.swift
//  Popcorn
//
//  Created by Petru Popa on 4/26/21.
//

import Foundation

class DetailViewModel: NSObject {
    
    var movie: MovieData
    
    public init(movie: MovieData) {
        self.movie = movie
    }
    
}
