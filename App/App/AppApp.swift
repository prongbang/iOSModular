//
//  AppApp.swift
//  App
//
//  Created by prongbang on 26/10/2567 BE.
//

import SwiftUI

@main
struct AppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
