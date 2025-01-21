//
//  FlowLayout.swift
//  FriendFace
//
//  Created by Gary on 3/1/2025.
//

import SwiftUI

struct FlowLayout: Layout {
    var horizontalSpacing: CGFloat = 5
    var verticalSpacing: CGFloat = 5
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        
        var position = CGPoint.zero
        var maxHeight: CGFloat = 0
        var lineHeight: CGFloat = 0
        
        for (index, size) in sizes.enumerated() {
            if index != 0 {
                position.x += horizontalSpacing
            }
            
            if position.x + size.width > (proposal.width ?? .infinity) {
                position.x = 0
                position.y += lineHeight + verticalSpacing
                lineHeight = 0
            }
            
            lineHeight = max(lineHeight, size.height)
            position.x += size.width
            maxHeight = max(maxHeight, position.y + lineHeight)
        }
        
        return CGSize(width: proposal.width ?? .infinity, height: maxHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        
        var position = CGPoint(x: bounds.minX, y: bounds.minY)
        var lineHeight: CGFloat = 0
        
        
        for (index, subview) in subviews.enumerated() {
            let size = sizes[index]
            
            if index != 0 {
                position.x += horizontalSpacing
            }
            
            if position.x + size.width > bounds.maxX {
                position.x = bounds.minX
                position.y += lineHeight + verticalSpacing
                lineHeight = 0
            }
            
            subview.place(at: position, proposal: .unspecified)
            
            lineHeight = max(lineHeight, size.height)
            position.x += size.width
        }
    }
}

//#Preview {
//    FlowLayout()
//}

