//
//  PostSingleView.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-27.
//

import SwiftUI

struct PostSingleView: View {
    let header: String
    let description: String
    let time: String
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 240)
                .foregroundColor(.Gray02)
            Text(header)
                .font(.title)
                .fontWeight(.semibold)
            VStack(alignment: .leading ,spacing: 4) {
                Text(description)
                Text(time)
                    .foregroundColor(.Gray03)
            }
        }
        .padding()
    }
}

struct PostSingleView_Previews: PreviewProvider {
    static var previews: some View {
        PostSingleView(header: "Header", description: "He'll want to use your yacht, and I don't want this thing smelling like fish.", time: "8m ago")
    }
}
