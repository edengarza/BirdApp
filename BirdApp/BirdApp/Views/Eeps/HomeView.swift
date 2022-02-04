//
//  HomeView.swift
//  BirdApp
//
//  Created by Edén Garza on 1/29/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List(eeps.sorted(by: {$0.id > $1.id}), id: \.id) { eep in
                ZStack {
                    NavigationLink {
                        EepDetail(eep: eep)
                    } label: {
                        EepRow(eep: eep)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    CircleImage(image: Image(messageThreads[0].receiverUsername))
                        .frame(width: 30, height: 30)
                }
                ToolbarItem(placement: .principal) {
                    Image(systemName: "sun.min")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "moon.stars")
                }
            }
        }
        .padding(.top, 0.1)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
