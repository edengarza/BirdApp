//
//  NotificationsView.swift
//  BirdApp
//
//  Created by Edén Garza on 1/30/22.
//

import SwiftUI

enum NotifView: String, CaseIterable, Identifiable {
    case all, mentions
    var id: Self { self }
}

struct NotificationsView: View {
    @State private var selectedNotificationView: NotifView = .all
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    NotificationSegmentedPicker(
                        NotifView.allCases,
                        selectedIndex: Binding(
                            get: {selectedNotificationView.index},
                            set: {selectedNotificationView = NotifView.allCases[$0 ?? 0] }),
                        content: {item, isSelected in
                            Text(item.rawValue.capitalized)
                                .foregroundColor(isSelected ? Color("Inverted") : Color.gray)
                                .padding(.vertical, 8)
                        },
                        selection: {
                            VStack(spacing: 0) {
                                Spacer()
                                Rectangle()
                                    .fill(Color("Inverted"))
                                    .frame(height: 1)
                            }
                        })
                        .animation(.easeInOut, value: 0.3)
                    if selectedNotificationView == .all {
                        NotificationsAllView()
                    } else {
                        NotificationsMentionsView()
                    }
                    Spacer()
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("Notifications")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                CircleImage(image: Image(messageThreads[0].receiverUsername))
                                    .frame(width: 30, height: 30)
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Image(systemName: "gearshape")
                            }
                        }
                }
                .onAppear(perform: { UITableView.appearance().separatorStyle = .none })
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

extension CaseIterable where Self: Equatable {
    var index: Self.AllCases.Index? {
        return Self.allCases.firstIndex { self == $0 }
    }
}
