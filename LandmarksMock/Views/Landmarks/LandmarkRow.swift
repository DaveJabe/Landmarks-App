//
//  LandmarkRow.swift
//  LandmarksMock
//
//  Created by David Jabech on 9/19/22.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        LandmarkRow(landmark: landmarks[0])
    }
}
