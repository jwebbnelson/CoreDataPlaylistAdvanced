//
//  PlaylistController.swift
//  CoreDataMiniProject
//
//  Created by Jordan Nelson on 2/13/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let sharedController = PlaylistController()
    
    var myPlaylists: [Playlist] {
        
        let request = NSFetchRequest(entityName: "Playlist")
        
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            // WE know the returned managed objects will be songs
            return try moc.executeFetchRequest(request) as! [Playlist]
        } catch {
            return []
        }
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving \(error)")
        }
    }
    
    func createPlaylist(name: String) {
        let _ = Playlist(name: name)
        saveToPersistentStore()
    }
    
    // REMOVES Playlist from the array
    func removeSong(playlist: Playlist) -> () {
        
        // MOC Off of playlist object, could have used stack
        // This would work if using multiple moc
        if let moc = playlist.managedObjectContext {
            moc.deleteObject(playlist)
            saveToPersistentStore()
        }
    }
    
    
    //////   SONG  ///////
    func addSongToPlaylist(title: String, artist: String, playlist:Playlist) {
        let _ = Song(title: title, artist: artist, playlist: playlist)
        saveToPersistentStore()
    }
    
    
}