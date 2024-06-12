import Foundation
import Combine

import Foundation
import Combine

class FootballAPI: ObservableObject {
    static let shared = FootballAPI()
    
    @Published var teams: [Team] = []
    private var cancellables = Set<AnyCancellable>()
    
    private let apiKey = "8a53a346adee4db4bb0ef7b8d7754a0a"
    
    func fetchTeams(leagueID: String) {
        let urlString = "https://api.football-data.org/v2/competitions/\(leagueID)/teams"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "X-Auth-Token")
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: TeamsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching teams: \(error)")
                }
            }, receiveValue: { [weak self] teamsResponse in
                self?.teams = teamsResponse.teams
            })
            .store(in: &cancellables)
    }
}

struct TeamsResponse: Decodable {
    let teams: [Team]
}

struct TeamResponse: Decodable {
    let team: Team
}
