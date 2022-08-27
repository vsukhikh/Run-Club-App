//
//  FeedView.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-27.
//

import SwiftUI

struct FeedView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                ProfilePostsView()
            }
            .searchable(text: $searchText)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Feed")
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
            .toolbar {
                Button(action: {print("Filter!")}) {
                    Text("Filter")
                        .fontWeight(.medium)
                        .foregroundColor(.GreenPrimary)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
