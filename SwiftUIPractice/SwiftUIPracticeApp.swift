//
//  SwiftUIPracticeApp.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 10/07/2026.
//

import SwiftUI
import SwiftfulRouting

@main
struct SwiftUIPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                SpotifyHomeView()
            }
            
        }
    }
}
