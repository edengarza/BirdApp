//
//  NotificationSegmentedPicker.swift
//  BirdApp
//
//  Created by Edén Garza on 1/30/22.
//

import SwiftUI

public struct SearchSegmentedPicker<Element, Content, Selection>: View
    where
    Content: View,
    Selection: View {
    
    public typealias Data = [Element]
    
    @State private var frames: [CGRect]
    @Binding private var selectedIndex: Data.Index?
    
    private let data: Data
    private let selection: () -> Selection
    private let content: (Data.Element, Bool) -> Content
    
    public init(_ data: Data, selectedIndex: Binding<Data.Index?>, @ViewBuilder content: @escaping (Data.Element, Bool) -> Content, @ViewBuilder selection: @escaping () -> Selection) {
        self.data = data
        self.content = content
        self.selection = selection
        self._selectedIndex = selectedIndex
        self._frames = State(wrappedValue: Array(repeating: .zero, count: data.count))
    }
    
    public var body: some View {
        ZStack(alignment: Alignment(horizontal: .horizontalCenterAlignment, vertical: .center)) {
            HStack() {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(data.indices, id: \.self) { index in
                            Button(action: { selectedIndex = index },
                                   label: { content(data[index], selectedIndex == index) }
                            )
                            .buttonStyle(PlainButtonStyle())
                            .background(GeometryReader { proxy in
                                Color.clear.onAppear { frames[index] = proxy.frame(in: .global) }
                            })
                            .alignmentGuide(.horizontalCenterAlignment, isActive: selectedIndex == index) { dimensions in
                                dimensions[HorizontalAlignment.center]
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
        }
    }
}
