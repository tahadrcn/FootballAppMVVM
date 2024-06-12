import SwiftUI

struct LeaguesView: View {
    var body: some View {
        NavigationView {
            List(leagues) { league in
                NavigationLink(destination: TeamsView(leagueID: league.id)) {
                    HStack {
                        Image(league.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Text(league.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Leagues")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LeaguesView()
    }
}
