import Foundation

struct League: Identifiable {
    let id: String
    let name: String
    let imageName: String
}

let leagues = [
    League(id: "PL", name: "Premier League", imageName: "premier_league"),
    League(id: "SA", name: "Serie A", imageName: "serie_a"),
    League(id: "BL1", name: "Bundesliga", imageName: "bundesliga"),
    League(id: "PD", name: "La Liga", imageName: "primera_division"),
    League(id: "FL1", name: "Ligue 1", imageName: "ligue1"),
    League(id: "DED", name: "Eredivisie", imageName: "eredivisie"),
    League(id: "BSA", name: "Campeonato Brasileiro Série A", imageName: "brasileirao"),
    League(id: "CL", name: "UEFA Champions League", imageName: "champions_league"),
    League(id: "WC", name: "FIFA World Cup", imageName: "world_cup"),
]
