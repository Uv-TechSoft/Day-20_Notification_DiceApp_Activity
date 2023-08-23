//
//  ViewController.swift
//  Notification_ActivityController_Experinment
//
//  Created by Imam MohammadUvesh on 02/12/21.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,UNUserNotificationCenterDelegate {
    
    //MARK: Varibles
    var notify = UNUserNotificationCenter.current()
   
    //MARK: Helper Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        notify.requestAuthorization(options: [.badge, .sound, .alert])
        {
            isGranted, error in
            if isGranted
            {
                self.notify.delegate = self
            }
        }
    }


    @IBAction func notificationTapped(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
        content.title = "Hello, This is a content Part"
        content.subtitle = "This is a subtitle Part"
        content.body = "This is a body part"
        content.sound = .default
        content.badge = 1
        
        //MARK: Show Post in the Notification
        let imageName = "attchment"
        guard let url = Bundle.main.url(forResource: imageName, withExtension: "png") else{ return }
        print(url)
        let attchment = try! UNNotificationAttachment(identifier: imageName, url: url, options: nil)
        content.attachments = [attchment]
        
        
        let identifier = "My identifier"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notify.add(request)
        {
            error in
            if error != nil
            {
                print(error)
            }
        }
    }
    
    
    //MARK: Delegate Methods
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .list, .banner])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        {
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    @IBAction func shareActivityTapped(_ sender: UIButton) {
        let title = "Remind and Alert For Lensto Update"
        let img = UIImage(systemName: "person.circle.fill")
        let activityController = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        
//        activityController.excludedActivityTypes = [.airDrop,.postToFacebook,.postToTwitter]
        self.present(activityController, animated: true, completion:  nil)
        
    }
    
}

