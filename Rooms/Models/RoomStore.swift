//
//  RoomStore.swift
//

import SwiftUI

class RoomStore: ObservableObject {
    @Published var rooms: [Room]

    init(rooms: [Room]) {
        self.rooms = rooms
    }
}
