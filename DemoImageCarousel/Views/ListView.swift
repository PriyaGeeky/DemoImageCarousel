//
//  ListView.swift
//  DemoImageCarousel
//
//  Created by Priyanka Sahani on 27/08/24.
//

import SwiftUI

struct ListView: View {
    @Environment(Store.self) private var store
    @State private var searchText: String = ""
    var filteredItems: [SampleImage] {
        if searchText.isEmpty {
            return store.sampleImages
        } else {
            return store.sampleImages.filter { $0.caption.lowercased().contains(searchText.lowercased()) }
        }
    }
    var body: some View {
        GeometryReader { geo in
            VStack {
                SearchView(searchText: $searchText)
                    .offset(y: max(-geo.frame(in: .global).minY, 0))
                    
                ForEach(filteredItems, id: \.self) { sampleImage in
                    HStack {
                        AsyncImage(url: sampleImage.imageUrl) { image in
                            image
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 70, height: 70, alignment: .leading)
                        .scaledToFill()
                        .padding()
                        VStack(alignment: .leading) {
                            Text(sampleImage.caption)
                                .font(.headline)
                            Text(sampleImage.caption)
                                .font(.subheadline)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 40, alignment: .leading)
                    .background(Color(red: 210 / 255, green: 231 / 255, blue: 225 / 255))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .listRowSeparator(.hidden)
                }
            }
            .frame(width: geo.size.width)
        }
    }
}

#Preview {
    ListView()
        .environment(Store())
}
