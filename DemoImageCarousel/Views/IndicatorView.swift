//
//  IndicatorView.swift
//  DemoImageCarousel
//
//  Created by Priyanka Sahani on 27/08/24.
//

import SwiftUI

struct IndicatorView: View {
    let imageCount: Int
    @Binding var scrollID: Int?
    var body: some View {
        HStack {
            ForEach(0..<imageCount, id: \.self) { indicator in
            let index = scrollID ?? 0
                Button {
                    withAnimation {
                        scrollID = indicator
                    }
                } label: {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 8))
                        .foregroundStyle(indicator == index ? Color.blue : Color(.lightGray))
                }
            }
        }
        .padding(7)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.clear)).opacity(0.2))

    }
}
