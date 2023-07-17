//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
    @StateObject var store = RoomStore(rooms: [])

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                RoomList(store: store)
            }
        } else {
            NavigationView {
                RoomList(store: store)
            }
        }
    }
}

struct RoomList: View {
    @ObservedObject var store: RoomStore
    @State var editMode: EditMode = .inactive

    var body: some View {
        List {
            Section {
                Button(action: addRoom) {
                    Text("Add Room")
                }
                .disabled(editMode != .inactive)
            }
            Section {
                ForEach(store.rooms) { room in
                    RoomCell(room: room)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
        }
        .navigationTitle(Text("Rooms"))
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                EditButton()
            }
        }
        .listStyle(.grouped)
        .environment(\.editMode, $editMode)
    }

    private func addRoom() {
        let roomNumber = Int.random(in: 1...100)
        let capacity = Int.random(in: 2...50)
        store.rooms.append(Room(name: "Room \(roomNumber)", capacity: capacity))
    }

    private func delete(at offsets: IndexSet) {
        store.rooms.remove(atOffsets: offsets)
    }

    private func move(fromOffsets sources: IndexSet, toOffset destination: Int) {
        store.rooms.move(fromOffsets: sources, toOffset: destination)
    }
}

struct RoomCell: View {
    let room: Room
    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)) {
            HStack {
                Image(room.thumbnailName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)

                VStack(alignment: .leading) {
                    Text(room.name)
                        .font(.headline)
                    Text("\(room.capacity) people")
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    ContentView(store: RoomStore(rooms: Rooms.testData))
}

@available(iOS 15.0, *)
#Preview {
    ContentView(store: RoomStore(rooms: Rooms.testData))
        .dynamicTypeSize(.xxxLarge)
        .environment(\.colorScheme, .dark)
        .environment(\.locale, Locale(identifier: "ja"))
}
