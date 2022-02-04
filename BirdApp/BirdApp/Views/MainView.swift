//
//  ContentView.swift
//  BirdApp
//
//  Created by Edén Garza on 1/29/22.
//

import SwiftUI
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var width = UIScreen.main.bounds.width - 90
    @State var x = -UIScreen.main.bounds.width + 90
    @State var slideShowing = false
    
    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                NotificationsView()
                    .tabItem {
                        Image(systemName: "bell")
                    }
                MessagesView()
                    .tabItem {
                        Image(systemName: "envelope")
                    }
            }
            .navigationBarTitleDisplayMode(.inline)
            SlideMenuView()
                .shadow(color: Color.black.opacity(x != 0 ? 0.1 : 0), radius: 5, x: 5, y: 0)
                .offset(x: x)
                .background(Color.black.opacity(x == 0 ? 0.5 : 0))
                .ignoresSafeArea(.all, edges: .vertical)
                .onTapGesture {
                    withAnimation {
                        x = -width
                    }
                }
        }
        .gesture(DragGesture().onChanged({ (value) in
            if slideShowing {
                if value.startLocation.x > value.predictedEndLocation.x {
                    withAnimation {
                        if value.translation.width > 0 {
                            if x < 0 {
                                x = -width + value.translation.width
                            }
                        } else {
                            x = value.translation.width
                        }
                    }
                }
            } else {
                if (value.startLocation.x < value.predictedEndLocation.x) && value.startLocation.x > 50 {
                    withAnimation {
                        if value.translation.width > 0 {
                            if x < 0 {
                                x = -width + value.translation.width
                            }
                        } else {
                            x = value.translation.width
                        }
                    }
                }
            }
        }).onEnded({ (value) in
            withAnimation {
                if -x < width / 2 {
                    x = 0
                    slideShowing = true
                } else {
                    x = -width
                    slideShowing = false
                }
            }
        }))
    }
}

extension UINavigationBar {
    func setNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad();
        interactivePopGestureRecognizer?.delegate = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
