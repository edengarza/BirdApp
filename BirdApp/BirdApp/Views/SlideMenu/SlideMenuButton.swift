//
//  SlideMenuButton.swift
//  BirdApp
//
//  Created by Edén Garza on 2/1/22.
//

import SwiftUI

struct SlideMenuButton: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .padding()
            Text(title)
                .font(.system(size: 15))
            Spacer()
        }
    }
}

struct SlideMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SlideMenuButton(icon: "person", title: "Profile")
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
