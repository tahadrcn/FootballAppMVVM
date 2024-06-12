//
//  TeamsView.swift
//  football
//
//  Created by Taha Dirican on 11.06.2024.
//

import SwiftUI

struct URLImage: View {
    let urlString: String?
    
    @State private var image: Image? = nil
    
    var body: some View {
        if let image = image {
            image
                .resizable()
                .scaledToFit()
        } else {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .onAppear {
                    loadImage()
                }
        }
    }
    
    private func loadImage() {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, let uiImage = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }.resume()
    }
}
struct TeamsView: View {
    @StateObject private var footballAPI = FootballAPI.shared
    let leagueID: String
    
    var body: some View {
        List(footballAPI.teams) { team in
            NavigationLink(destination: TeamDetailView(team: team)) {
                HStack {
                    URLImage(urlString: team.crestUrl)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(team.name)
                            .font(.headline)
                    }
                }
            }
        }
        .onAppear {
            footballAPI.fetchTeams(leagueID: leagueID)
        }
        .navigationTitle("Teams")
    }
}



#Preview {
    TeamsView(leagueID: "PL")
}
