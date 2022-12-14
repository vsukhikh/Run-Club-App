//
//  HealthStore.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-27.
//

import Foundation
import HealthKit

class HealthStore {
    
    var healthStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    func calculateSteps (completion: @escaping (HKStatisticsCollection?) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        
        let anchorDate = Date.mondayAt12AM()
        
        let daily = DateComponents(day: 1)
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: anchorDate, intervalComponents: daily)
        
        query!.initialResultsHandler = { query, stattisticsCollection, error in
            completion(stattisticsCollection)
        }
        
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
    }
    
    func requestAutherization(completion: @escaping (Bool) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        
        guard let healthStore = self.healthStore else {
            return completion(false)
        }
        
        healthStore.requestAuthorization(toShare: [], read: [stepType]) {(success, error) in
            completion(success)
        }
    }
}


extension Date {
    static func mondayAt12AM() -> Date {
        return Calendar(identifier: .iso8601).date(from: Calendar(identifier: .iso8601).dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
    }
}

extension HKQuantity {
    func addQuantitiesFromSamples(samples : [HKQuantitySample], unit: HKUnit) -> HKQuantity  {

        var currentValue = doubleValue(for: unit)

        for sample in samples {
            let value = sample.quantity.doubleValue(for: unit)
            currentValue += value
        }
        let result = HKQuantity(unit: unit, doubleValue: currentValue)
        return result
    }
}
