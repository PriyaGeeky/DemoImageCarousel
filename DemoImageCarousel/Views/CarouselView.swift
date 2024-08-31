//
//  CarouselView.swift
//  DemoImageCarousel
//
//  Created by Priyanka Sahani on 27/08/24.
//

import SwiftUI

struct CarouselView: View {
    @Environment(Store.self) private var store
    @State private var scrollID: Int?
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(0..<store.sampleImages.count, id: \.self) { index in
                        let sampleImage = store.sampleImages[index]
                        VStack {
                            AsyncImage(url: sampleImage.imageUrl) { image in
                                image
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: UIScreen.main.bounds.width - 80, alignment: .center)
                            .scaledToFit()
                            .padding()
                        }
                        .frame(width: UIScreen.main.bounds.width - 80, alignment: .center)
                        .padding([.leading, .trailing], 40)
                        .scrollTransition(.animated, axis: .horizontal) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.6)
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.6)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $scrollID)
            .scrollTargetBehavior(.paging)
            IndicatorView(imageCount: store.sampleImages.count, scrollID: $scrollID)
        }
        .frame(height: UIScreen.main.bounds.height / 3, alignment: .top)
    }
}

#Preview {
    CarouselView()
        .environment(Store())
}
