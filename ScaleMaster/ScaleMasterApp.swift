//
//  ScaleMasterApp.swift
//  ScaleMaster
//
//  Created by Carter Hawkins on 12/17/22.
//

import SwiftUI

@main
struct ScaleMasterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppInfoStorage())
        }
    }
}
