//
//  TeamsDetailView.swift
//  football
//
//  Created by Taha Dirican on 12.06.2024.
//

import SwiftUI

struct TeamDetailView: View {
    let team: Team
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            URLImage(urlString: team.crestUrl)
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .padding()
            
            Text("\(team.name)")
                .font(.title)
                .bold()
                .padding(.horizontal)
            
            if let founded = team.founded {
                Text("Founded: \(founded)")
                    .padding(.horizontal)
            }
            
            if let venue = team.venue {
                Text("Venue: \(venue)")
                    .padding(.horizontal)
            }
            
            if let clubColors = team.clubColors {
                Text("Club Colors: \(clubColors)")
                    .padding(.horizontal)
            }
            
            
            if let website = team.website, let url = URL(string: website) {
                Link("Visit Website", destination: url)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle(team.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}




