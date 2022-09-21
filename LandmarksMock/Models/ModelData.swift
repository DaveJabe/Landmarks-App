//
//  ModelData.swift
//  LandmarksMock
//
//  Created by David Jabech on 9/17/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var categories: [String: [Landmark]] {
        return Dictionary(grouping: landmarks,
                          by: { $0.category.rawValue })
    }
    
    var features: [Landmark] {
        return landmarks.filter({ $0.isFeatured })
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    }
    catch {
        fatalError("Couldn't load contents of \(filename) from main bundle: \n\(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    }
    catch {
        fatalError("Couldn't decode contents of \(filename) from main bundle: \n\(error)")
    }
}
