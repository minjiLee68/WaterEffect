//
//  UNNotificationCenter.swift
//  TimeToTakeMedicine
//
//  Created by 이민지 on 2022/05/13.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationRequest(by alert: Alert) {
        let content = UNMutableNotificationContent()
        content.title = "약 드실 시간이에요 💊"
        content.body = "의사 선생님이 지금 약 안먹으면 혼난데요🙈"
        content.sound = .default
        content.badge = 1
        
        let component = Calendar.current.dateComponents([.hour, .minute], from: alert.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: alert.isOn)
        
        let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
        
        self.add(request, withCompletionHandler: nil)
    }
}
