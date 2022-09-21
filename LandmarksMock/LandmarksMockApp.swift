//
//  LandmarksMockApp.swift
//  Shared
//
//  Created by David Jabech on 9/17/22.
//

import SwiftUI

@main
struct LandmarksMockApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
