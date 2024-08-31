//
//  SampleImage.swift
//  DemoImageCarousel
//
//  Created by Priyanka Sahani on 27/08/24.
//

import Foundation

struct SampleImage: Identifiable, Codable, Hashable {
    let id: Int
    let imageUrl: URL
    let caption: String
}
