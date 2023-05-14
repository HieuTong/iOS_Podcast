//
//  PodcastCell.swift
//  Podcast
//
//  Created by Le Tong Minh Hieu on 09/04/2023.
//

import UIKit
import SDWebImage

class PodcastCell: UITableViewCell {
    
    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var episodeCountLabel: UILabel!
    
    var podcast: Podcast! {
        didSet {
            trackNameLabel.text = podcast.trackName
            artistNameLabel.text = podcast.artistName
            episodeCountLabel.text = "\(podcast.trackCount ?? 0) Episodes"

            print("Loading image with url: ", podcast.artworkUrl60 ?? "")
            guard let url = URL(string: podcast.artworkUrl60 ?? "") else { return }
//            URLSession.shared.dataTask(with: url) { data, _, _ in
//                guard let data = data else { return }
//                DispatchQueue.main.async { [weak self] in
//                    self?.podcastImageView.image = UIImage(data: data)
//                }
//            }.resume()
            podcastImageView.sd_setImage(with: url, completed: nil)
        }
    }
}
