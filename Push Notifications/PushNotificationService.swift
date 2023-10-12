//
//  PushNotificationService.swift
//  Push Notifications
//
//  Created by Mac Padilla on 10/11/23.
//

import Foundation
import NotificationCenter

class PushNotificationService {
    var isPermissionGranted = false

    func requestPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                self.isPermissionGranted = true
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func scheduleNotificationFootball(title: String, subtitle: String) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        let trigger = UNCalendarNotificationTrigger(dateMatching: .init(year: 2023, month: 10, day: 13, hour: 20, minute: 0), repeats: true)
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(notificationRequest)
    }
    func scheduleNotificationBaseball(title: String, subtitle: String) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        let trigger = UNCalendarNotificationTrigger(dateMatching: .init(year: 2023, month: 10, day: 12, hour: 18, minute: 0), repeats: true)
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(notificationRequest)
    }
    func scheduleNotificationHockey(title: String, subtitle: String) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        let trigger = UNCalendarNotificationTrigger(dateMatching: .init(year: 2023, month: 10, day: 14, hour: 20, minute: 0), repeats: true)
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(notificationRequest)
    }
    
    func clearNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
