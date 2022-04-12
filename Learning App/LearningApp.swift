//
//  Learning_AppApp.swift
//  Learning App
//
//  Created by Octav Radulian on 12.04.2022.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
            // create an instance of the contentModel and set it as environmentObject since all our views will use this data
                .environmentObject(ContentModel())
        }
    }
}
