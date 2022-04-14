//
//  ContentModel.swift
//  Learning App
//
//  Created by Octav Radulian on 12.04.2022.
//

import Foundation

//create the view model class , since this will keep all our data for our views it will conform to ObservableObject protocol

class ContentModel: ObservableObject {
    //list of modules
    @Published var modules = [Module]()
    
    //current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    //current lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    //current lesson explanation
    @Published var lessonDescription = NSAttributedString() // set it as an empty NSAtribstring 
    
    var styleData : Data?
    
    //this init method is getting called when we createe a new contentModel instance -> see main
    init() {
        getLocalData()
    }
    
    // MARK: - Data Methods
    
    func getLocalData() {
        
        //get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            //read file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            //try to decode json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            //assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            //TODO log error
            print("Couldn't parse json local data")
        }
        
        
        //parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            //read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            //try to decode style into an array of styles
            self.styleData = styleData
        }
        catch {
            //log error
            print("Couldn't parse the style data")
        }
       
        
        
        
    }
    
    // MARK: - Module Navigation methods
    
    func beginModule(_ moduleid: Int) {
        
        //find the index for this module id
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                //found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        //set the current module
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex: Int) {
        
        //check that the lesson index is within range of module index
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }
        else {
            currentLessonIndex = 0
        }
        
        //set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        lessonDescription = addStyling(currentLesson!.explanation)
    }
    
    func nextLesson() {
        
        //advance the lesson
        currentLessonIndex += 1
        //check that it is within the range
        if currentLessonIndex < currentModule!.content.lessons.count {
            //set the current lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        }
        else {
            //reset the lesson state
            currentLessonIndex = 0
            currentLesson = nil
        }
        
        
        
    }
    
    func hasNextLesson() -> Bool {
        
        if currentLessonIndex + 1 < currentModule!.content.lessons.count {
            return true
        }
        else{
            return false
        }
        
    }
    
    // MARK: - Code Styling
    private func addStyling(_ htmlString: String) -> NSAttributedString {
        var resultString = NSAttributedString()
        var data = Data()
        
        //add the styling data
        if styleData != nil {
            data.append(self.styleData!)
        }
    
        //add the html data
        data.append(Data(htmlString.utf8))
        
        //convert to atributed string
        do {
            let atributedString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                
                resultString = atributedString
        }
        catch {
            print("Couldn't turn html into atributed string")
        }
        return resultString
    }
}
