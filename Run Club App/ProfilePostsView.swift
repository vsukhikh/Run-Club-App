//
//  ProfilePostsView.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-27.
//

import SwiftUI

struct ProfilePostsView: View {
    var body: some View {
        ForEach(0 ..< 5) { item in
            PostSingleView(header: "Header \(item)", description: "Something...", time: "8mo ago")
        }
    }
}

struct ProfilePostsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePostsView()
    }
}
