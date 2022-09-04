//
//  ScrollModifier.swift
//  SafelinkCodes
//
//  Created by Augustine Francis.
//  Provided by trailingclosure

import SwiftUI

struct ScrollingHStackModifier: ViewModifier {

    @State private var scrollOffset: CGFloat
    @State private var dragOffset: CGFloat
    @Binding var currentIndex: Int
    var items: Int
    var itemWidth: CGFloat
    var itemSpacing: CGFloat


    init(items: Int, itemWidth: CGFloat, itemSpacing: CGFloat, currentIndex: Binding<Int>) {
        self.items = items
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing
            // Calculate Total Content Width
        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
        let screenWidth = UIScreen.main.bounds.width

            // Set Initial Offset to first Item
        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - itemWidth) / 2.0)

        self._scrollOffset = State(initialValue: initialOffset)
        self._dragOffset = State(initialValue: 0)
        self._currentIndex = currentIndex
    }

    func body(content: Content) -> some View {
        content
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
            .onChanged({ event in
                dragOffset = event.translation.width
            })
            .onEnded({ event in
                scrollOffset += event.translation.width
                dragOffset = 0

                let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
                let screenWidth = UIScreen.main.bounds.width
                let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
                var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)
                print(index)
                if index.remainder(dividingBy: 1) > 0.5 {
                    index += 1;
                    currentIndex += 1
                    print(index)
                    print(currentIndex)
                } else {
                    index = CGFloat(Int(index))
                    currentIndex = Int(index)
                    print(currentIndex)
                }
                index = min(index, CGFloat(items) - 1)
                index = max(index, 0)
                let newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing
                withAnimation {
                    scrollOffset = newOffset
                }
            })
            )
    }
}
