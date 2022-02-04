//
//  SlideMenuView.swift
//  BirdApp
//
//  Created by Edén Garza on 1/31/22.
//

import SwiftUI

struct SlideMenuView: View {
    var curUser: EepUser = getUser("Eden")
    
    var body: some View {
        HStack(spacing: 0) {
            
            // The overall view
            VStack(alignment: .leading) {
                
                // The top section
                VStack {
                    HStack {
                        
                        // User info
                        VStack(alignment: .leading) {
                            CircleImage(image: curUser.profilePicture)
                                .frame(width: 50, height: 50)
                            
                            HStack(alignment: .top, spacing: 12) {
                                VStack(alignment: .leading) {
                                    Text(curUser.username)
                                        .font(.headline)
                                        .bold()
                                    Text("@\(curUser.handle)")
                                        .font(.caption)
                                }
                            }
                        }
                        Spacer()
                    }
                    
                    // Followers
                    HStack {
                        Text("3 Followers")
                            .font(.subheadline)
                        Text("3 Following")
                            .font(.subheadline)
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                Divider()
                Spacer(minLength: 0)
                
                // The scroll list with buttons
                ScrollView {
                    
                    VStack {
                        SlideMenuButton(icon: "person", title: "Profile")
                        
                        SlideMenuButton(icon: "list.bullet.rectangle.portrait", title: "Lists")
                        
                        SlideMenuButton(icon: "text.bubble", title: "Topics")
                        
                        SlideMenuButton(icon: "bookmark", title: "Bookmarks")
                        
                        SlideMenuButton(icon: "b.square", title: "Eeps Blue")
                        
                        SlideMenuButton(icon: "cloud.bolt", title: "Moments")
                        
                        SlideMenuButton(icon: "cart", title: "Shopping")
                        
                        SlideMenuButton(icon: "dollarsign.square", title: "Monetization")
                        
                        Divider()
                    }
                    
                    VStack {
                        SlideMenuButton(icon: "airplane.departure", title: "Twitter for professionals")
                        Divider()
                    }
                    
                    VStack {
                        SlideMenuButton(icon: "arrow.up.forward.app", title: "Eeps Ads")
                        Divider()
                    }
                    
                    VStack {
                        SlideMenuButton(icon: "", title: "Configuration and Privacy")
                            .offset(x: -50)
                        SlideMenuButton(icon: "", title: "Help Center")
                            .offset(x: -50)
                    }
                }
                
                // The footer
                Divider()
                HStack {
                    Image(systemName: "lightbulb")
                        .resizable()
                        .frame(width: 20, height: 30)
                        .padding()
                    Spacer()
                    Image(systemName: "qrcode")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 60)
            .padding(.bottom, 20)
            .frame(width: UIScreen.main.bounds.width - 90, alignment: .leading)
            .background(Color(UIColor.systemBackground))
            
            Spacer()
        }
    }
}

struct SlideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenuView()
    }
}
