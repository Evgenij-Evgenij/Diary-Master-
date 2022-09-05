//
//  Diary_masterApp.swift
//  Diary master
//
//  Created by Евгений Воронов on 09.08.2022.
//

import SwiftUI
import Firebase

@main
struct Diary_masterApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            //HomeView()
            SignInView()
        }
    }
}
