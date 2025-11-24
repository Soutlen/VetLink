import Foundation

protocol IDoctorsModel {
    func getAllDoctors(completion: @escaping (Result<[Doctor], Error>) -> Void)
}

struct Doctor: Codable, Identifiable {
    let id: UUID
    let name: String
    let specialty: String
    let price: String
    let expirience: String
    let rating: String
    let photoUrl: String
    let description: String
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case specialty
        case price
        case expirience = "expirience"
        case rating
        case photoUrl = "photo_url"
        case description
        case createdAt = "created_at"
    }
}

final class DoctorsModel: IDoctorsModel {
    private let supabaseManager: SupabaseManager
    
    init(supabaseManager: SupabaseManager) {
        self.supabaseManager = supabaseManager
    }
    
    func getAllDoctors(completion: @escaping (Result<[Doctor], Error>) -> Void) {
        supabaseManager.fetchAllDoctorsWithSupabase(completion: completion)
    }
}
