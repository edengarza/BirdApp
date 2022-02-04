//
//  EepRow.swift
//  BirdApp
//
//  Created by Edén Garza on 1/29/22.
//

import SwiftUI

struct EepRow: View {
    var eep: Eep
    
    var body: some View {
        HStack{
            VStack {
                CircleImage(image: eep.userAvi)
                    .frame(width: 50, height: 50)
                    .padding(5)
                Spacer()
            }
            VStack{
                Spacer()
                HStack {
                    Text(eep.username)
                        .bold()
                    Text("@\(getUser(eep.username).handle)")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text(eep.content)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "bubble.right")
                    Spacer()
                    Image(systemName: "arrowshape.zigzag.right")
                    Spacer()
                    Image(systemName: "heart")
                    Spacer()
                }
                .padding()
                .offset(x: -40)
            }
            Spacer()
        }
    }
}

struct EepRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EepRow(eep: eeps[0])
            EepRow(eep: eeps[1])
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
