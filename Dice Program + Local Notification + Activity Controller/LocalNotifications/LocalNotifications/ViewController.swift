//
//  ViewController.swift
//  LocalNotifications
//
//  Created by Yogesh Patel on 02/12/21.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { isGranted, error in
            if isGranted{
                self.notificationCenter.delegate = self
            }
        }
    }

    @IBAction func localNofificationButtonTapped(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "Hey, this is an example of local notifications."
        content.subtitle = "My local subtitle"
        content.body = "My description"
        content.sound = .default
        content.badge = 1
        
        let identifier = "My Identifier"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { error in
            if error != nil{
                print(error)
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .list, .banner])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController{
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        let title = "Remind me today is pratik birthday."
        let img = UIImage(named: "attchment")
        let activityController = UIActivityViewController(activityItems: [title, img], applicationActivities: nil)
        
//        activityController.excludedActivityTypes = [
//             .airDrop , .postToFacebook, .postToTwitter
//        ]
        
        self.present(activityController, animated: true, completion: nil)
    }
}

/*
 Add Image to Local Notification
 */
