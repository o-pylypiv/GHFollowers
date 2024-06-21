//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Olha Pylypiv on 17.06.2024.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
