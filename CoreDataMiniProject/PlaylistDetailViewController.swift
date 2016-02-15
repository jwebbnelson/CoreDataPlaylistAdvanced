//
//  PlaylistDetailViewController.swift
//  CoreDataMiniProject
//
//  Created by Jordan Nelson on 2/15/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import UIKit

class PlaylistDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var artistField: UITextField!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let playlist = playlist {
            updateViewWithPlaylist(playlist)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViewWithPlaylist(playlist:Playlist){
        title = playlist.name
    }

    @IBAction func addButtonTapped(sender: AnyObject) {
        if let playlist = playlist, let title = titleField.text, let artist = artistField.text {
            PlaylistController.sharedController.addSongToPlaylist(title, artist: artist, playlist: playlist)
            tableView.reloadData()
        }
    }
}

extension PlaylistDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("songCell", forIndexPath: indexPath)

        if let songSet = playlist?.songs {
            let songs = Array(songSet) as! [Song]
            let song = songs[indexPath.row]
            
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let songSet = playlist?.songs {
            let songs = Array(songSet) as! [Song]
            return songs.count
        } else {
            return 0
        }
    }
}



