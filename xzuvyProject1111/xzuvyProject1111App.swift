//
//  xzuvyProject1111App.swift
//  xzuvyProject1111
//
//  Created by Peter Clarke on 06.02.2023.
//

import SwiftUI
import Firebase


@main
struct xzuvyProject1111App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}
