//
//  AppDelegate.swift
//  MesanApplication
//
//  Created by galiev nail on 20.03.2021.
//

import UIKit
import CoreData
import Firebase
import SwiftKeychainWrapper

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    // swiftlint:disable redundant_type_annotation
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let accessToken = KeychainWrapper.standard.string(forKey: "accessToken")
        if accessToken != nil {
            let profilePage = mainStoryboard.instantiateViewController(identifier: "UserViewController") as! UserViewController
            self.window?.rootViewController = profilePage
        } else {
            let loginPage = mainStoryboard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MesanApplication")
        container.loadPersistentStores(completionHandler: { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
