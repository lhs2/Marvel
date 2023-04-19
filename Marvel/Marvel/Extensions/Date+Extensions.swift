//
//  Date+Extensions.swift
//  Marvel
//
//  Created by Luiz Henrique on 17/04/2023.
//

import Foundation

extension Date {
    static var timestamp: Int64{
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
}
