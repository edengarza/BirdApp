//
//  NotificationsAllView.swift
//  BirdApp
//
//  Created by Edén Garza on 1/30/22.
//

import SwiftUI

struct NotificationsAllView: View {
    var body: some View {
        List {
            ForEach(notifications, id: \.self) { notification in
                ZStack {
                    NavigationLink {
                        NotificationDetail(notification: notification)
                    } label: {
                        NotificationsRow(notification: notification)
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

struct NotificationsAllView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsAllView()
    }
}
