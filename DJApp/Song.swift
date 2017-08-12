//
//  Song.swift
//  DJApp
//
//  Created by Nguyen Do on 7/21/17.
//  Copyright © 2017 Gametime. All rights reserved.
//

import Foundation

class Song: Comparable {

    // isntance variables
    private var songId: String! // song id, use to get data from YouTube API
    private var upvotes: Int! // upvotes property
    private var downvotes: Int! // downvotes property
    private var apiData: SongYoutubeData! // api data from youtube (title, image, video)
    
    // constructors
    init() {
    
        songId = ""
        upvotes = 0
        downvotes = 0
        apiData = SongYoutubeData()
    
    }
    
    // why are upvotes/downvotes included in init? should be initialized to 0
    init(songId: String, upvotes: Int, downvotes: Int) {
    
        self.songId = songId
        self.upvotes = upvotes
        self.downvotes = downvotes
        self.apiData = SongYoutubeData(id: self.songId)
    
    }
    
    /*
     COMPARABLE (EQUATABLE) FUNCTIONS
     - necessary functions to implement Comparable protocol
     - allows for array to be sorted later on
     */
    static func < (lhs: Song, rhs: Song) -> Bool {
        return lhs.calculateScore() > rhs.calculateScore() // reversed inequality so that top song appears on top
    }
    
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.calculateScore() == rhs.calculateScore()
    }
    
    /**/
    public func calculateScore() -> Int {
        return upvotes - downvotes
    }
    
    public func incrementUpvotes() {
        upvotes = upvotes + 1
    }
    
    public func incrementDownvotes() {
        downvotes = downvotes + 1
    }
    
    // getters and setters
    public func getSongId() -> String {
        return songId
    }
    
    public func setSongId(newSongId: String) {
        songId = newSongId
    }
    
    public func getUpvotes() -> Int {
        return upvotes
    }
    
    public func setUpvotes(newUpvotes: Int) {
        upvotes = newUpvotes
    }
    
    public func getDownvotes() -> Int {
        return downvotes
    }
    
    public func setDownvotes(newDownvotes: Int) {
        downvotes = newDownvotes
    }
    
    public func getTitle() -> String {
        return apiData?.getTitle() ?? ""
    }
    
    public func getImageId() -> String {
        return apiData.getImageId()
    }

}
