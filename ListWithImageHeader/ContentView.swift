//
//  ContentView.swift
//  ListWithImageHeader
//
//  Created by FS on 2024/1/22.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                GeometryReader { proxy in
                    let y = proxy.frame(in: .named("List")).minY
                    
                    VStack {
                        Image(.p)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: screenWidth, height: y > 0 ? 340 + y : 340)
                            .clipped()
                            .ignoresSafeArea()
                            .offset(y: -y)
                    }
                }
                .frame(height: 340)
                
                VStack(spacing: 20) {
                    
                    ForEach(0...20, id: \.self) { _ in
                        Color.gray
                            .frame(height: 120)
                            .clipShape(.rect(cornerRadius: 20))
                    }
                    
                }
                .padding(.all, 20)
                .background(.white)
            }
            .coordinateSpace(.named("List"))
            .navigationTitle("RARA")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
