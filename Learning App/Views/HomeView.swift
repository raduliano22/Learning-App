//
//  ContentView.swift
//  Learning App
//
//  Created by Octav Radulian on 12.04.2022.
//

import SwiftUI

struct HomeView: View {
    //now we can get access with the model variable with the property wrapper
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 18)
                ScrollView {
                    
                    LazyVStack {
                        ForEach(model.modules) { module in
                            VStack(spacing: 20) {
                                // learning card
                                HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count:"\(module.content.lessons.count) Lessons", time: module.content.time)
                                
                                
                                // test card
                                HomeViewRow(image: module.test.image, title: " \(module.category) Test", description: module.test.description, count:"\(module.test.questions.count) Lessons", time: module.test.time)
                            }
                            
                        }
                    }
                    .padding()
                    
                }
            }
            .navigationTitle("Get Started")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
