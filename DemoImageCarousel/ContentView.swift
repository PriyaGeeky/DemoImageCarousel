//
//  ContentView.swift
//  DemoImageCarousel
//
//  Created by Priyanka Sahani on 27/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var scrolledId: Int? = nil
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    CarouselView()
                    ListView()
                }
                .frame(height: geo.size.height)
            }
            .safeAreaInset(edge: .bottom) {}
            
            FloatingButtonView()
        }
    }
}

#Preview {
    ContentView()
        .environment(Store())
}
