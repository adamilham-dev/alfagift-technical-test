//
//  studentApp.swift
//  student
//
//  Created by Adam on 24/01/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        SplashViewControllerWrapper()
            .edgesIgnoringSafeArea(.all)
    }
}

struct SplashViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SplashViewController {
        return SplashViewController()
    }

    func updateUIViewController(_ uiViewController: SplashViewController, context: Context) {
        // Leave empty as we don't need to update anything for now
    }
}

@main
struct studentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
