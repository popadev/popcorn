//
//  MovieTableViewCell.swift
//  Popcorn
//
//  Created by Petru Popa on 4/22/21.
//

import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    
    var movie: MovieData? {
        didSet {
            if let posterPath = movie?.posterPath,
               let posterImageUrl = URL(string: smallImageUrl + posterPath) {
                posterImageView.af.setImage(withURL: posterImageUrl)
            }
            
            titleLabel.text = movie?.title
            yearLabel.text = movie?.releaseDate.components(separatedBy: "-")[0]
//            descriptionLabel.text = ""
            voteAverageLabel.text = "\(movie?.voteAverage ?? 0.0)"
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSize = 3
            formatter.groupingSeparator = ","
            voteCountLabel.text = "\(formatter.string(from: NSNumber(value: movie?.voteCount ?? 0))!)"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
