//
//  WorkoutsView.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-27.
//

import SwiftUI

struct WorkoutSingleView: View {
    let name: String
    let km: String
    let time: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(name)
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
                        
                    HStack(spacing: 10) {
                        Text(km)
                        Text(time)
                    }
                    .opacity(0.5)
                }
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 130.0, height: 100.0)
                    .foregroundColor(.Gray02)
            }
            Divider()
        }
        .padding(.horizontal)
    }
}

struct WorkoutSingleView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutSingleView(name: "Run 1", km: "12 KM", time: "12:32")
    }
}
