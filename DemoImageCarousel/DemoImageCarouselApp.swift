//
//  DemoImageCarouselApp.swift
//  DemoImageCarousel
//
//  Created by Priyanka Sahani on 27/08/24.
//

import SwiftUI

@main
struct DemoImageCarouselApp: App {
    @State private var store = Store()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(store)
        }
    }
}
