import Foundation

struct Tracking: Decodable {
    let state: String
    let total: Int
    let positive: Int
    let death: Int
    let hospitalized: Int?
}
