//
//  DataLoader.swift
//  usfull
//
//  Created by Azar Aliyev on 23/05/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import Foundation

class DataLoader {
    
    @Published var countries = [Country]()
    
    init() {
        load()
    }
    
    func load() {
        
        if let fileLocation = Bundle.main.url(forResource: "country-region-data", withExtension: "json") {
            
            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Country].self, from: data)
                
                self.countries = dataFromJson
            } catch {
                print(print(error))
            }
        }
    }
    
    
}
