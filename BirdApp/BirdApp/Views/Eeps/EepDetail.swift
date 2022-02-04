//
//  EepDetail.swift
//  BirdApp
//
//  Created by Edén Garza on 1/29/22.
//

import SwiftUI

struct EepDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var eep: Eep
    
    var body: some View {
        ScrollView{
            HStack{
                CircleImage(image: eep.userAvi)
                    .frame(width: 50, height: 50)
                    .padding()
                VStack(alignment: .leading){
                    Text(eep.username)
                        .font(.headline)
                        .bold()
                    Text("@\(getUser(eep.username).handle)")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                }
                Spacer()
            }
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text(eep.content)
                        .padding()
                    Text("EepId: \(eep.id), EepHash: \(eep.hashValue)")
                        .padding(.leading, 15)
                        .foregroundColor(Color.gray)
                        .font(.footnote)
                }
                Spacer()
            }
            HStack {
                Spacer()
                Image(systemName: "bubble.right")
                Spacer()
                Image(systemName: "arrowshape.zigzag.right")
                Spacer()
                Image(systemName: "heart")
                Spacer()
                Image(systemName: "square.and.arrow.up")
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Eep")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.backward")
                    })
                        .foregroundColor(Color("Inverted"))
                }
                
            }
        }
    }
}

struct EepDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EepDetail(eep: eeps[0])
        }
        
    }
}

struct NavAppearanceModifier: ViewModifier {
    init() {
        UINavigationBar.appearance().tintColor = UIColor.black
    }
    
    func body(content: Content) -> some View {
        content
    }
}
