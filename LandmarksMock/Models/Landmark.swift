//
//  Landmark.swift
//  LandmarksMock
//
//  Created by David Jabech on 9/17/22.
//

import SwiftUI
import CoreLocation

struct Landmark: Codable, Hashable, Identifiable {
    let name: String
    let category: Category
    let city: String
    let state: String
    let id: Int
    let isFeatured: Bool
    var isFavorite: Bool
    let park: String
    let coordinates: Coordinates
    let description: String
    let imageName: String
    
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    var image: Image {
        return Image(imageName)
    }
    
    var featureImage: Image? {
        return isFeatured ? Image(imageName+"_feature") : nil
    }
    
    
    enum Category: String, Codable, CaseIterable {
        case rivers = "Rivers"
        case lakes = "Lakes"
        case mountains = "Mountains"
    }
    
    struct Coordinates: Codable, Hashable {
        let latitude: Double
        let longitude: Double
    }
}
