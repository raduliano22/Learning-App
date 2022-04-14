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
    
}
