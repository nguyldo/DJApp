//
//  SongsViewController.swift
//  DJApp
//
//  Created by Nguyen Do on 7/19/17.
//  Copyright © 2017 Gametime. All rights reserved.
//

import UIKit

class SongsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let searchSongViewController = SearchSongViewController()
    var searchController: UISearchController {
        return UISearchController(searchResultsController: searchSongViewController)
    }
    
    // *********** EXAMPLE DATA *************** //
    private var songs = [Song(songId: "id1", upvotes: 0, downvotes: 0),
                         Song(songId: "id2", upvotes: 0, downvotes: 0),
                         Song(songId: "id3", upvotes: 0, downvotes: 0),
                         Song(songId: "id4", upvotes: 0, downvotes: 0)]
    
    /*
     upvote/downvotePressed()
     - get indexPath through 'sender' superviews
     - use indexPath to identify song to upvote/downvote
     - call resortTableView() function to update tableView data
     */
    @IBAction func upvotePressed(_ sender: UIButton) {
        let indexPath = tableView.indexPath(for: sender.superview?.superview as! SongTableViewCell)
        
        songs[indexPath!.item].incrementUpvotes()
        
        resortTableView()
    }
    
    @IBAction func downvotePressed(_ sender: UIButton) {
        let indexPath = tableView.indexPath(for: sender.superview?.superview as! SongTableViewCell)
        
        songs[indexPath!.item].incrementDownvotes()
        
        resortTableView()
    }
    
    private func findImage(id: String) -> UIImage {
        return #imageLiteral(resourceName: "background")
    }
    
    /*
     resortTableView()
     - sort songs array (possible with Comparable protocol)
     - call reloadData() on tableView to update with sorted array
     */
    private func resortTableView() {
        songs.sort()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = searchSongViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
     TABLEVIEW FUNCTIONS
     - numberOfRowsInSection: return songs array count
     - cellForRowAt: populates cell with data using indexPath to identify Song from songs array
     */
    // need override keyword?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongTableViewCell
        
        cell.songTitleLabel.text = songs[indexPath.item].getSongId()
        cell.funImage = findImage(id: songs[indexPath.item].getImageId())
        
        
        return cell
    }
    
}
