//
//  ResearchRouteApp.swift
//  ResearchRoute
//
//  Created by Mac on 3/19/24.
//

import Firebase
import SwiftUI

@main
struct ResearchRouteApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
