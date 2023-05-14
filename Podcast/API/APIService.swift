//
//  APIService.swift
//  Podcast
//
//  Created by Le Tong Minh Hieu on 09/04/2023.
//

import Foundation
import Alamofire
import FeedKit

class APIService {
    let baseiTunesSearchURL = "https://itunes.apple.com/search"
    
    // singleton
    static let shared = APIService()
    
    func fetchEpisodes(feedUrl: String, completionHandler: @escaping ([Episode]) -> ()) {
        let secureFeedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        guard let url = URL(string: secureFeedUrl) else { return }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            let parser = FeedParser(URL: url)
            parser?.parseAsync(result: { [weak self] result in
                guard let strongSelf = self else { return }
                if let err = result.error {
                    print("Failed to parse XML feed: ", err)
                    return
                }
                
                guard let feed = result.rssFeed else { return }
                let episodes = feed.toEpisodes()
                completionHandler(episodes)
            })
        }
        
    }
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {
        print("Searching for podcasts...")
        
        let parameters = ["term": searchText, "media": "podcast"]
        
        Alamofire.request(baseiTunesSearchURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { [weak self] dataResponse in
            if let err = dataResponse.error {
                print("Failed to contact yahoo", err)
                return
            }
            
            guard let data = dataResponse.data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                completionHandler(searchResult.results)
            } catch let decodeErr {
                print("Failed to decode: ", decodeErr)
            }
        }
    }
}

struct SearchResults: Decodable {
    let resultCount: Int
    let results: [Podcast]
}

