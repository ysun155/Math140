//
//  DataModel.swift
//  math140
//
//  Created by Adrian on 5/17/22.
//

import Foundation

class RentData {
    var month: Int
    var year: Int
    var bedNum: Int
    var price: Int
    
    init(month: Int, year: Int, bedNum: Int, price: Int) {
        self.month = month
        self.year = year
        self.bedNum = bedNum
        self.price = price
    }
}
