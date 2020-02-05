//
//  SceneDelegate.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 12.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import UIKit
import SwiftUI
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // Get the managed object context from the shared persistent container.
        //        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            fatalError("Unable to read managed object context.")
        }
//        let mediFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Medi")
//        do{
//            let results = try context.fetch(mediFetch)
//            let mediResults = results as! [Medi]
//            for medi in mediResults {
//                context.delete(medi)
//            }
//        }catch{
//            print(error)
//        }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DosageType")
        let fetchIntervalRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "IntervalType")
        
        do{
            let results = try context.fetch(fetchRequest)
            let intervalTypeResults = try context.fetch(fetchIntervalRequest)

            let dosageTypes = results as! [DosageType]
            let intervalTypes = intervalTypeResults as! [IntervalType]
            
            if !intervalTypes.contains { $0.name == "Minute" }{
                let interval = IntervalType(context: context)
                interval.name = "Minute"
                interval.idx = 0
            }
            
            if !intervalTypes.contains { $0.name == "Hour" }{
                let interval = IntervalType(context: context)
                interval.name = "Hour"
                interval.idx = 1
            }
            
            if !intervalTypes.contains { $0.name == "Day" }{
                let interval = IntervalType(context: context)
                interval.name = "Day"
                interval.idx = 2
            }
            
            if !intervalTypes.contains { $0.name == "Week" }{
                let interval = IntervalType(context: context)
                interval.name = "Week"
                interval.idx = 3
            }
          
            if !dosageTypes.contains { $0.name == "Spritze" } {
                let s = DosageType(context: context)
                s.name = "Spritze"
            }
            
            if !dosageTypes.contains { $0.name == "Tablette" } {
                let t = DosageType(context: context)
                t.name = "Tablette"
            }
        
            if !dosageTypes.contains { $0.name == "Saft" } {
                let s = DosageType(context: context)
                s.name = "Saft"
            }
            
        }catch{
            print(error)
        }
        
        do{
            try context.save()
        }catch{
            print(error)
        }
        
        // Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath.
        // Add `@Environment(\.managedObjectContext)` in the views that will need the context.
        let contentView = MediListView(viewModel: MediListViewModel())
            .background(Color(.blue))
            .environment(\.managedObjectContext, context)
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}

