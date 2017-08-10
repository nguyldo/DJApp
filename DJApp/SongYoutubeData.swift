//
//  SongYoutubeData.swift
//  DJApp
//
//  Created by Nguyen Do on 8/5/17.
//  Copyright © 2017 Gametime. All rights reserved.
//

import Foundation

class SongYoutubeData {

    private var title: String!
    private var imageId: String!
    
    init(id: String) {
        switch id {
        case "id1":
            title = "Song 1"
            imageId = "1"
        case "id2":
            title = "Song 2"
            imageId = "2"
        case "id3":
            title = "Song 3"
            imageId = "3"
        case "id4":
            title = "Song 4"
            imageId = "4"
        default:
            title = ""
            imageId = "0"
        }
    }
    
    init() {
        title = ""
        imageId = "0"
    }
    
    // getters
    public func getTitle() -> String {
        return title
    }
    
    public func getImageId() -> String {
        return imageId
    }

}
