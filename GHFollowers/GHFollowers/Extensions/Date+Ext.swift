//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Daria on 27.02.2024.
//

import Foundation

extension Date {
    func convertToMYFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
    
  
}
