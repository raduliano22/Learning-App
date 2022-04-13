//
//  HomeViewRow.swift
//  Learning App
//
//  Created by Octav Radulian on 12.04.2022.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
      
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            //sometimes is not ok to have a hardcoded value for the frame , use the aspect ratio for the modifier
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                //.frame(width: 335, height: 175)
            
            HStack {
                
                //image
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                //text
                VStack(alignment: .leading, spacing: 10) {
                    
                    //headline
                    Text(title)
                        .bold()
                    //description
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                    
                    //icons
                    HStack {
                        //number of lessons/questions
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(.caption)
                        
                        Spacer()
                        
                        //time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 10))
                    }
                    
                    
                }
                .padding(.leading, 20)
            }
            .padding(.horizontal, 20)
            
        }
        
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "learn swift", description:"some description" , count: "10 lessons", time: "1 hour")
    }
}
