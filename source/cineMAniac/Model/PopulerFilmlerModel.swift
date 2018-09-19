//
//  File.swift
//  cineMAniac
//
//  Created by Glny Gl on 5.09.2018.
//  Copyright © 2018 Glny Gl. All rights reserved.
//

import Foundation
import SwiftyJSON


class PopulerFilmlerModel {
    
    var poster_path: String = ""
    var adult: Bool  = false
    var overview: String  = ""
    var release_date: String  = ""
    var genre_ids : [Int]  = []
    var id: Int = 0
    var original_title: String  = ""
    var original_language: String  = ""
    var title: String  = ""
    var backdrop_path: String  = ""
    var popularity: Double = 0.0
    var vote_count: Int = 0
    var video: Bool = false
    var vote_average: Double = 0.0
    
    
    init(json:JSON) {
        id = json["id"].intValue
        original_title = json["original_title"].stringValue
    }
    
}
