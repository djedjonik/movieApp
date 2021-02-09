//
//  MovieNetworkManager.swift
//  MovieApp
//
//  Created by Andrew Boldyrev on 30.01.2021.
//

import Foundation


class MovieNetworkManager {
    
    
    func fetchJson(completion: @escaping(Result<Movies, Error>) ->()) {
        let jsonUrlString = "https://kaverin-ddb.firebaseio.com/dbs/movies.json?print=pretty"

        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movies = try decoder.decode(Movies.self, from: data!)
                completion(.success(movies))
                
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
        }.resume()
    }
   
}
