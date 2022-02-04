//
//  View+OptionalAlignment.swift
//  BirdApp
//
//  Created by Edén Garza on 1/30/22.
//

import SwiftUI

extension View {
    @ViewBuilder
    @inlinable func alignmentGuide(_ alignment: HorizontalAlignment, isActive: Bool, computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View {
        if isActive {
            alignmentGuide(alignment, computeValue: computeValue)
        } else {
            self
        }
    }
    
    @ViewBuilder
    @inlinable func alignmentGuide(_ alignment: VerticalAlignment, isActive: Bool, computeValue: @escaping (ViewDimensions) -> CGFloat) -> some View {
        if isActive {
            alignmentGuide(alignment, computeValue: computeValue)
        } else {
            self
        }
    }
}
