//
//  CountryCity.swift
//  usfull
//
//  Created by Azar Aliyev on 22/05/2020.
//  Copyright © 2020 Azar Aliyev. All rights reserved.
//

import Foundation

struct Region: Codable {
    var name: String?
    var shortCode: String?
}

struct Country: Codable {
    var countryName: String?
    var countryShortCode: String?
    var regions: [Region]?
}

func getCountryList() -> [Country] {
    guard let path = Bundle.main.path(forResource: "country-region-data", ofType: "json") else {
        fatalError()
    }
    do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        return try JSONDecoder().decode([Country].self, from: data)
    } catch (let error) {
        print("error: \(error.localizedDescription)")
    }
    return []
}
