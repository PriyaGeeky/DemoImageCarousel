//
//  SearchView.swift
//  DemoImageCarousel
//
//  Created by Priyanka Sahani on 31/08/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    @FocusState private var isTextFieldFocused: Bool
    var body: some View {
        VStack {
            // Search bar with a search icon
            HStack {
                // Search icon
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                // TextField for user input
                TextField("Search", text: $searchText)
                    .foregroundColor(.primary)
                    .focused($isTextFieldFocused)
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 50)
        .onTapGesture {
            isTextFieldFocused = true
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    @State static private var previewSearchText: String = ""
    
    static var previews: some View {
        SearchView(searchText: $previewSearchText)
    }
}
