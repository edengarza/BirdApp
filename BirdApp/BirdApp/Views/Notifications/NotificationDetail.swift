//
//  NotificationDetail.swift
//  BirdApp
//
//  Created by Edén Garza on 1/30/22.
//

import SwiftUI

struct NotificationDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var notification: Notification
    
    var body: some View {
        ScrollView{
            HStack{
                CircleImage(image: getEep(notification.eepId).userAvi)
                    .frame(width: 50, height: 50)
                    .padding()
                VStack(alignment: .leading){
                    Text(getEep(notification.eepId).username)
                        .font(.headline)
                        .bold()
                    Text("@\(getUser(getEep(notification.eepId).username).handle)")
                        .foregroundColor(Color.gray)
                        .font(.caption)
                }
                Spacer()
            }
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text(getEep(notification.eepId).content)
                        .padding()
                    Text("EepId: \(notification.eepId), EepHash: \(getEep(notification.eepId).hashValue)")
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
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(pastTenseType(type: notification.type))
                            .font(.headline)
                            .fixedSize()
                        Text("by \(notification.username)")
                            .font(.subheadline)
                            .fixedSize()
                    }
                }
            }
        }
    }
}

struct NotificationDetail_Previews: PreviewProvider {
    static var previews: some View {
        NotificationDetail(notification: notifications[0])
    }
}
