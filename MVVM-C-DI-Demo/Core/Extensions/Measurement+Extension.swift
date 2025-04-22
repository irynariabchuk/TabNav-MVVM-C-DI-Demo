//
//  Measurement+Extension.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

extension Measurement where UnitType == UnitTemperature {
    
    func formatted() -> String {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.unitOptions = .providedUnit
        formatter.numberFormatter = NumberFormatter()
        formatter.numberFormatter.maximumFractionDigits = 0
        
        return formatter.string(from: self)
    }
}
