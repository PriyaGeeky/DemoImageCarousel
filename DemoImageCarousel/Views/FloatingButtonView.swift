//
//  FloatingButtonView.swift
//  DemoImageCarousel
//
//  Created by Priyanka Sahani on 28/08/24.
//

import SwiftUI

struct FloatingButtonView: View {
    @State private var showActionSheet: Bool = false
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    showActionSheet = true
                }) {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 60, height: 60)
                        .background(Circle().fill(Color.blue))
                        
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(
                        title: Text("Options"),
                        message: Text("Choose an option"),
                        buttons: [
                            .default(Text("Option1")) {
                                print("Option 1 Tapped")
                            },
                            .default(Text("Option2")) {
                                print("Option 2 Tapped")
                            },
                            .cancel()
                        ]
                    )
                }
            }
        }
    }
}

#Preview {
    FloatingButtonView()
}
