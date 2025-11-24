import Foundation
import Supabase

class SupabaseManager {
    
    let client: SupabaseClient
    
    init(client: SupabaseClient) {
        // ИСПРАВЛЕНО: используем переданный client, а не создаем новый
        self.client = client
    }
    
    //Doctors
    func fetchAllDoctorsWithSupabase(completion: @escaping (Result<[Doctor], Error>) -> Void) {
        Task {
            do {
                let doctors: [Doctor] = try await client
                    .from("doctors")
                    .select()
                    .order("created_at", ascending: false)
                    .execute()
                    .value
                
                completion(.success(doctors))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
