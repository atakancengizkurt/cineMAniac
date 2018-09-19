//
//  populerMovies.swift
//  cineMAniac
//
//  Created by Glny Gl on 3.09.2018.
//  Copyright © 2018 Glny Gl. All rights reserved.
//

import Foundation

 struct populerMovies{
    let page: Int
    var results : [populerMovieResults]
    let total_results: Int
    let total_pages: Int
    
    enum serializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init(json: [String:Any]) throws {
        guard let page = json["page"] as? Int else {throw serializationError.missing("page is missing")}
        guard let results = json["results"] as? [[String:Any]] else {throw serializationError.missing("results is missing")}
        guard let total_results = json["total_results"] as? Int else {throw serializationError.missing("total_results is missing")}
        guard let total_pages = json["total_pages"] as? Int else {throw serializationError.missing("total_pages is missing")}
        
        self.page = page
        self.total_results = total_results
        self.total_pages = total_pages
        
        self.results = []
        for result in results
        {
            let parsedResult = try populerMovieResults(json: result)
            print(parsedResult.original_title)
            self.results.append(parsedResult)
        }
    }
}

struct populerMovieResults{
    let poster_path: String?
    let adult: Bool
    let overview: String
    let release_date: String
    let genre_ids : [Int]
    let id: Int
    let original_title: String
    let original_language: String
    let title: String
    let backdrop_path: String?
    let popularity: Double
    let vote_count: Int
    let video: Bool
    let vote_average: Double
    
    enum serializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init(json:[String:Any]) throws {
    
        guard let poster_path = json["poster_pa!th"] as? String else {throw serializationError.missing("poster_path is missing")}
       guard let adult = json["adult"] as? Bool else {throw serializationError.missing("adult is missing")}
       guard let overview = json["overview"] as? String else {throw serializationError.missing("overview is missing")}
       guard let release_date = json["release_date"] as? String else {throw serializationError.missing("release_date is missing")}
       guard let genre_ids = json["genre_ids"] as? [Int] else {throw serializationError.missing("genre_ids is missing")}
       guard let id = json["id"] as? Int else {throw serializationError.missing("id is missing")}
       guard let original_title = json["original_title"] as? String else {throw serializationError.missing("original_title is missing")}
       guard let original_language = json["original_language"] as? String else {throw serializationError.missing("original_language is missing")}
       guard let title = json["title"] as? String else {throw serializationError.missing("title is missing")}
       guard let backdrop_path = json["backdrop_path"] as? String else {throw serializationError.missing("backdrop_path is missing")}
       guard let popularity = json["popularity"] as? Double else {throw serializationError.missing("popularity is missing")}
       guard let vote_count = json["vote_count"] as? Int else {throw serializationError.missing("vote_count is missing")}
       guard let video = json["video"] as? Bool else {throw serializationError.missing("video is missing")}
       guard let vote_average = json["vote_average"] as? Double else {throw serializationError.missing("vote_average is missing")}
        
        self.poster_path = poster_path
        self.adult = adult
        self.overview = overview
        self.release_date = release_date
        self.genre_ids = genre_ids
        self.id = id
        self.original_title = original_title
        self.original_language = original_language
        self.title = title
        self.backdrop_path = backdrop_path
        self.popularity = popularity
        self.vote_count = vote_count
        self.video = video
        self.vote_average = vote_average
        
    }
    
}


