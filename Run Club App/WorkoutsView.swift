//
//  WorkoutsView.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-27.
//

import SwiftUI

struct WorkoutsView: View {
    var body: some View {
        ForEach(0 ..< 8) { item in
            WorkoutSingleView(name: "Run \(item)", km: "\((Float16(item) + 1) * 1.34) KM", time: "12:21")
        }
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
    }
}
