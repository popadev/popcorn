//
//  ResultsViewController.swift
//  Popcorn
//
//  Created by Petru Popa on 4/23/21.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var queryLabel: UILabel!
    @IBOutlet weak var movieTableView: UITableView!
    
    var viewModel: ResultsViewModel!
    var dataSource: MovieTableViewDataSource<MovieTableViewCell, MovieData>!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.queryLabel.text = self.viewModel.query.uppercased()
        updateTable()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController, let cell = sender as? MovieTableViewCell {
            detailViewController.viewModel = DetailViewModel(movie: cell.movie!)
        }
    }
    
    func updateTable() {
        self.dataSource = MovieTableViewDataSource(cellIdentifier: "MovieTableViewCell", items: self.viewModel.movies.results, configureCell: { (cell, movie) in
            cell.movie = movie
            cell.backgroundColor = .clear
        })
        self.movieTableView.dataSource = dataSource
        self.movieTableView.reloadData()
    }
    
    @IBAction func unwindToResultsViewController(segue: UIStoryboardSegue) {
        
    }

}

extension ResultsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "detail", sender: tableView.cellForRow(at: indexPath))
    }
    
}
