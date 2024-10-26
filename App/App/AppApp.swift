//
//  AppApp.swift
//  App
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
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
