//
//  ContentDetailView.swift
//  Learning App
//
//  Created by Octav Radulian on 14.04.2022.
//

import SwiftUI
//import AVKit for video
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? "" ))
        
        VStack {
            
            //only show video if we get a valid url
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            //TODO: Description
            CodeTextView()
            
            //Show next lesson button only if there is a next lesson
            if model.hasNextLesson() {
                Button {
                    //go to next lesson
                    //advance the lesson
                    model.nextLesson()
                } label: {
                    
                    ZStack {
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
            else {
                //Show the complete button
                Button {
                    //go to next lesson
                    //advance the lesson
                    model.currentContentSelected = nil
                    
                } label: {
                    
                    ZStack {
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text("Complete")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
           

        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
        
        
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
