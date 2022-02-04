//
//  CircleImage.swift
//  BirdApp
//
//  Created by Edén Garza on 1/29/22.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.black, lineWidth: 2)
            }
            .shadow(radius: 1)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("Eden"))
    }
}
