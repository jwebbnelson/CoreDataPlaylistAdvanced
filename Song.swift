//
//  Song.swift
//  CoreDataMiniProject
//
//  Created by Jordan Nelson on 2/13/16.
//  Copyright © 2016 Jordan Nelson. All rights reserved.
//

import Foundation
import CoreData


class Song: NSManagedObject {

    // ONLY can be created with a context
    convenience init(title:String, artist:String, playlist:Playlist, context:NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Song", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext:context)
        
        self.title = title
        self.artist = artist
        self.playlist = playlist
    }

}
