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
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
