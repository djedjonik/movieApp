//
//  MovieModel.swift
//  MovieApp
//
//  Created by Andrew Boldyrev on 30.01.2021.
//

import Foundation

struct MovieModel: Codable {
    let actors, awards: String
    let boxOffice: String?
    let country: Country
    let dvd: String?
    let director, genre, language, metascore: String
    let plot: String
    let poster: String
    let production: String?
    let rated: String
    let ratings: [Rating]?
    let released: String
    let response: Response
    let runtime, title: String
    let type: TypeEnum
    let website: Website?
    let writer, year, imdbID, imdbRating: String
    let imdbVotes: String
    let totalSeasons: String?

    enum CodingKeys: String, CodingKey {
        case actors = "Actors"
        case awards = "Awards"
        case boxOffice = "BoxOffice"
        case country = "Country"
        case dvd = "DVD"
        case director = "Director"
        case genre = "Genre"
        case language = "Language"
        case metascore = "Metascore"
        case plot = "Plot"
        case poster = "Poster"
        case production = "Production"
        case rated = "Rated"
        case ratings = "Ratings"
        case released = "Released"
        case response = "Response"
        case runtime = "Runtime"
        case title = "Title"
        case type = "Type"
        case website = "Website"
        case writer = "Writer"
        case year = "Year"
        case imdbID, imdbRating, imdbVotes, totalSeasons
    }
}

enum Country: String, Codable {
    case newZealand = "New Zealand"
    case usa = "USA"
    case usaSouthKorea = "USA, South Korea"
}

// MARK: - Rating
struct Rating: Codable {
    let source: Source
    let value: String

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
    



enum Source: String, Codable {
    case internetMovieDatabase = "Internet Movie Database"
    case metacritic = "Metacritic"
    case rottenTomatoes = "Rotten Tomatoes"
    
}


enum Response: String, Codable {
    case responseTrue = "True"
}

enum TypeEnum: String, Codable {
    case movie = "movie"
    case series = "series"
}

enum Website: String, Codable {
    case nA = "N/A"
}


typealias Movies = [MovieModel]
