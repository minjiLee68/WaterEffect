//
//  Alert.swift
//  TimeToTakeMedicine
//
//  Created by 이민지 on 2022/05/13.
//

import Foundation

struct Alert: Codable {
    var id: String = UUID().uuidString
    let date: Date
    var isOn: Bool
    
    var time: String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        return timeFormatter.string(from: date)
    }
    
    var merdiem: String {
        let merdiemFormatter = DateFormatter()
        merdiemFormatter.dateFormat = "a"
        merdiemFormatter.locale = Locale(identifier: "Ko")
        return merdiemFormatter.string(from: date)
    }
    
}
