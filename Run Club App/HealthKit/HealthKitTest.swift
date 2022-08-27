//
//  HealthKitTest.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-27.
//

import SwiftUI
import HealthKit

struct HealthKitTest: View {
    private var healthStore: HealthStore?
    @State private var steps: [Step] = [Step]()
    
    init() {
        healthStore = HealthStore()
    }
    
    private func updateUIFromStatistics(statisticsCollection: HKStatisticsCollection) {

        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate!, to: endDate) { (statistics, stop) in
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            let step = Step(count: Int(count ?? 0), date: statistics.startDate)
            steps.append(step)
            
        
        }
    }
    
    var body: some View {
        List(steps, id: \.id) { step in
            HStack {
                Text("\(step.count)")
                Spacer()
                Text(step.date, style: .date)
            }
        }
            .onAppear {
                if let healthStore = healthStore {
                    healthStore.requestAutherization { success in
                        if success {
                            healthStore.calculateSteps { statisticsCollection in
                                if let statisticsCollection = statisticsCollection {
                                    //update the UI
                                    updateUIFromStatistics(statisticsCollection: statisticsCollection)
                                }
                            }
                        }
                    }
                }
            }
    }
}

struct HealthKitTest_Previews: PreviewProvider {
    static var previews: some View {
        HealthKitTest()
    }
}
