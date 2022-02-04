//
//  SearchView.swift
//  BirdApp
//
//  Created by Edén Garza on 1/31/22.
//

import SwiftUI

enum SearchViewEnum: String, CaseIterable, Identifiable {
    case forYou, trending, covid, news, sports, entertainment
    var id: Self { self }
}

func getSearchEnumText(searchViewEnum: SearchViewEnum) -> String {
    switch searchViewEnum {
    case .forYou:
        return "For you"
    case .trending:
        return "Trending"
    case .covid:
        return "COVID-19"
    case .news:
        return "News"
    case .sports:
        return "Sports"
    case .entertainment:
        return "Entertainment"
    }
}

struct SearchView: View {
    @State private var selectedSearchView: SearchViewEnum = .forYou
    @State var searchText = ""
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    SearchSegmentedPicker(
                        SearchViewEnum.allCases,
                        selectedIndex: Binding(
                            get: {selectedSearchView.index},
                            set: {selectedSearchView = SearchViewEnum.allCases[$0 ?? 0] }),
                        content: {item, isSelected in
                            Text(getSearchEnumText(searchViewEnum: item))
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
                    Spacer()
                    switch selectedSearchView {
                    case .forYou:
                        SearchForYouView()
                            .gesture(DragGesture()
                                .onChanged({_ in
                                    UIApplication.shared.dismissKeyboard()
                                })
                            )
                    case .trending:
                        SearchTrendingView()
                            .gesture(DragGesture()
                                .onChanged({_ in
                                    UIApplication.shared.dismissKeyboard()
                                })
                            )
                    case .covid:
                        SearchCovidView()
                            .gesture(DragGesture()
                                .onChanged({_ in
                                    UIApplication.shared.dismissKeyboard()
                                })
                            )
                    case .news:
                        SearchNewsView()
                            .gesture(DragGesture()
                                .onChanged({_ in
                                    UIApplication.shared.dismissKeyboard()
                                })
                            )
                    case .sports:
                        SearchSportsView()
                            .gesture(DragGesture()
                                .onChanged({_ in
                                    UIApplication.shared.dismissKeyboard()
                                })
                            )
                    case .entertainment:
                        SearchEntertainmentView()
                            .gesture(DragGesture()
                                .onChanged({_ in
                                    UIApplication.shared.dismissKeyboard()
                                })
                            )
                    }
                    Spacer()
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("Search")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                CircleImage(image: Image(messageThreads[0].receiverUsername))
                                    .frame(width: 30, height: 30)
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Image(systemName: "gearshape")
                            }
                            ToolbarItem(placement: .principal) {
                                SearchBar(searchText: $searchText)
                            }
                        }
                }
            }
        }
    }
}

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("lightgray"))
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.gray)
                TextField("Search on BirdApp", text: $searchText)
                    .fixedSize()
            }
            .foregroundColor(Color.gray)
            .padding()
        }
        .frame(height: 35)
        .cornerRadius(20)
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
