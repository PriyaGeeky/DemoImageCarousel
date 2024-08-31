//
//  Store.swift
//  DemoImageCarousel
//
//  Created by Priyanka Sahani on 27/08/24.
//

import Foundation

@Observable
class Store {
    var jsonUrl = "https://stewartlynch.github.io/CarouselImages/samples.json"
    var sampleImages: [SampleImage] = []
    init() {
        Task {
            await fetchSamples()
        }
    }

    @MainActor
    func fetchSamples() async {
        do {
            let (data, _) = try  await URLSession.shared.data(from: URL(string: jsonUrl)!)
            sampleImages = try JSONDecoder().decode(
                [SampleImage].self,
                from: data
            ).sorted(using: KeyPathComparator(\.caption))
            
        } catch {
            print("Could not decode")
        }
    }
}
