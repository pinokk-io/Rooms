//
//  RoomDetail.swift
//

import SwiftUI

struct RoomDetail: View {
    let room: Room
    @State private var zoomed = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(room.name), displayMode: .inline)
                .onTapGesture {
                    withAnimation {
                        self.zoomed.toggle()
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)

            if room.hasVideo && !zoomed {
                Image(systemName: "video.fill")
                    .font(.title)
                    .padding(.all)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

#Preview {
    NavigationView { RoomDetail(room: testData[0]) }
}

#Preview {
    NavigationView { RoomDetail(room: testData[1]) }
}
