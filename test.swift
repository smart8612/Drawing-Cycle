//
//  EnterWithNotifications - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureNotification()
    }
    
    func configureNotification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if let error = error {
                // Handle the error here.
                fatalError()
            }
            
            // Enable or disable features based on the authorization.
            
        }
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        pushNotification()
    }
    
    func pushNotification() {
        // 앱이 지원하는 알림 유형을 정의합니다.
        let content = UNMutableNotificationContent()
        content.title = "Hi there"
        content.body = "This is the letter from England..."
        content.userInfo = ["target_view" : "yellow_view"]
        
        // 알림 유형과 관련된 사용자 지정 작업을 정의합니다.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (1), repeats: false)
        
        
        // 배달을 위해 지역 알림을 예약합니다. , Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(
            identifier: uuidString,
            content: content,
            trigger: trigger
        )
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.delegate = self
        
        notificationCenter.add(request) { (error) in
            if error != nil {
                // Handle any errors.
                fatalError()
            }
        }
        
        // 이미 전달된 알림을 처리합니다.
        
        // 사용자가 선택한 작업에 응답합니다.
    }
    
    
}

extension ViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        print(notification)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .banner, .list, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("recieve")
        
        
        // Get the meeting ID from the original notification.
        let userInfo = response.notification.request.content.userInfo
        let targetView = userInfo["target_view"] as! String
        
        // Perform the task associated with the action.
        print(userInfo)
        
        switch targetView {
        case "yellow_view":
            
            print("Hello")
            
            //yellowVCsegue
//            performSegue(withIdentifier: "yellowVCsegue", sender: nil)
            self.tabBarController?.selectedIndex = 1
            let navigationVC = tabBarController?.selectedViewController as? UINavigationController
            
            print(navigationVC)
            
            let colorViewController = navigationVC?.viewControllers.first
            colorViewController?.performSegue(withIdentifier: "yellowVCsegue", sender: nil)
            
            
            
            break
            
        case "DECLINE_ACTION":
            
            break
            
            // Handle other actions…
            
        default:
            break
        }
        
        
        completionHandler()
    }
    
}

