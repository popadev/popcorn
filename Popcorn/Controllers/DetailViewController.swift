//
//  DetailViewController.swift
//  Popcorn
//
//  Created by Petru Popa on 4/26/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var viewModel: DetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initUI()
    }
    
    func initUI() {
        self.titleLabel.text = self.viewModel.movie.title
        self.yearLabel.text = self.viewModel.movie.releaseDate.components(separatedBy: "-")[0]
        
        if let posterPath = self.viewModel.movie.backdropPath,
           let posterImageUrl = URL(string: largeImageUrl + posterPath) {
            self.backdropImageView.af.setImage(withURL: posterImageUrl)
        }
        
        self.voteAverageLabel.text = "\(self.viewModel.movie.voteAverage)"
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSize = 3
        formatter.groupingSeparator = ","
        self.voteCountLabel.text = "\(formatter.string(from: NSNumber(value: self.viewModel.movie.voteCount))!)"
        
        self.overviewLabel.text = self.viewModel.movie.overview
    }

}
