//
//  NotificationsRow.swift
//  BirdApp
//
//  Created by Edén Garza on 1/30/22.
//

import SwiftUI

struct NotificationsRow: View {
    var notification: Notification
    var body: some View {
        HStack{
            VStack {
                Image(systemName: notification.icon)
                    .resizable()
                    .scaledToFit()
                    .tint(Color("Inverted"))
                    .frame(width: 30, height: 30)
                    .padding()
                Spacer()
            }
            VStack {
                HStack() {
                    VStack {
                        CircleImage(image: getUser(notification.username).profilePicture)
                            .frame(width: 40, height: 40)
                    }
                    Spacer()
                }
                HStack {
                    VStack {
                        Text("**\(notification.username)** \(pastTenseType(type: notification.type)) you")
                    }
                    Spacer()
                }
                HStack {
                    VStack {
                        if notification.type != "follow" {
                            Text(getEep(notification.eepId).content)
                                .font(.caption)
                        } else {
                            Text("")
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct NotificationsRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationsRow(notification: notifications[0])
            NotificationsRow(notification: notifications[1])
            NotificationsRow(notification: notifications[2])
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
