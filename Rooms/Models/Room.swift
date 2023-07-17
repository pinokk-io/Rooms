//
//  Room.swift
//

import Foundation

struct Room: Identifiable {
    var id = UUID()
    var name: String
    var capacity: Int
    var hasVideo: Bool = false

    var imageName: String { "Room" }
    var thumbnailName: String { "RoomThumb" }
}

let testData = [
    Room(name: "Observation Deck", capacity: 6, hasVideo: false),
    Room(name: "Excutive Suite", capacity: 8, hasVideo: true),
    Room(name: "Charter Jet", capacity: 16, hasVideo: true),
    Room(name: "Dungeon", capacity: 10, hasVideo: true),
    Room(name: "Panorama", capacity: 12, hasVideo: false),
    Room(name: "Oceanfront", capacity: 8, hasVideo: false),
    Room(name: "Rainbow Room", capacity: 10, hasVideo: true),
    Room(name: "Pastoral", capacity: 7, hasVideo: false),
    Room(name: "Elephant Room", capacity: 1, hasVideo: false),
]
