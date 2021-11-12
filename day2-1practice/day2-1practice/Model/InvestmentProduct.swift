//
//  InvestmentProduct.swift
//  day2-1practice
//
//  Created by temp on 2021/11/08.
//

import Foundation
import SwiftUI

enum InvestmentProductStatus: String, Codable {
    case new
    case willOpenSoon
    case closed
}

struct InvestmentProduct: Hashable, Codable, Identifiable {
    var id: String { productNumber }
    
    var productNumber: String
    var annualInterest: Double
    var timePeriod: Int
    var description: String
    var currentStatus: InvestmentProductStatus
    var thumbnailName: String?
    var ddayStatus: String?
}
