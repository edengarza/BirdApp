//
//  MessagesView.swift
//  BirdApp
//
//  Created by Edén Garza on 1/30/22.
//

import SwiftUI

struct MessagesView: View {
    @State private var searchText = ""
    var body: some View {
        ZStack {
            VStack {
                NavigationView{
                    List {
                        ForEach(messageThreads, id: \.self) { thread in
                            ZStack {
                                ThreadRow(thread: thread)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Messages")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            CircleImage(image: Image(messageThreads[0].receiverUsername))
                                .frame(width: 30, height: 30)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
