//
//  ProfileSummary.swift
//  LandmarksMock
//
//  Created by David Jabech on 9/19/22.
//

import SwiftUI

struct ProfileSummary: View {
    
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                HStack {
                    HikeBadge(name: "First Hike")
                    HikeBadge(name: "Earth Day")
                        .hueRotation(Angle(degrees: 90))
                    HikeBadge(name: "Tenth Hike")
                        .grayscale(0.6)
                        .hueRotation(Angle(degrees: 45))
                }
                .padding()
            }
            
            Divider()
            
            VStack {
                Text("Recent Hikes")
                    .font(.headline)
                
                HikeView(hike: modelData.hikes[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: .default)
            .environmentObject(ModelData())
    }
}
