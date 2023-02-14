//
//  ViewController.swift
//  Local Notification
//
//  Created by shoeb on 03/02/23.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func notificationBTN(_ sender: Any) {
        let noticenter = UNUserNotificationCenter.current()
        noticenter.requestAuthorization(options: [.alert, .sound]) { (allowed, error) in
            if allowed {
                print("Permission Grand")
            }else{
                print("Permission Not Grand")
            }
        }
        let content = UNMutableNotificationContent()
        content.title = "Alert"
        content.body = "Please Check This Message Notification"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request = UNNotificationRequest(identifier: "404", content: content, trigger: trigger)
        noticenter.add(request) { (error) in
            print("\(String(describing: error?.localizedDescription))")
        }
    }
    
}

