//
//  ThreadRow.swift
//  BirdApp
//
//  Created by Edén Garza on 1/30/22.
//

import SwiftUI

struct ThreadRow: View {
    var thread: DirectMessage
    var body: some View {
        HStack{
            VStack {
                CircleImage(image: getUser(thread.senderUsername).profilePicture)
                    .frame(width: 60, height: 60)
                    .padding(5)
            }
            VStack{
                HStack {
                    Text(thread.senderUsername)
                        .bold()
                    Text("@\(getUser(thread.senderUsername).handle)")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                .padding(.top, 7)
                HStack {
                    Text(thread.content)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ThreadRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ThreadRow(thread: messageThreads[0])
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
