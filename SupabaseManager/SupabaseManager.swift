
import Foundation
import Supabase

class SupabaseManager {
    
    let client: SupabaseClient
    
    init(client: SupabaseClient) {
        self.client = SupabaseClient(
            supabaseURL: Constants.Supabase.supabaseURL,
            supabaseKey: Constants.Supabase.apiKey
        )
    }
    
    //Doctors
    func fetchAllDoctorsWithSupabase() async throws -> [Doctor] {
        let doctors: [Doctor] = try await client
            .from("doctors")
            .select()
            .order("created_at", ascending: false)
            .execute()
            .value
        
        return doctors
    }
    
    func downloadImageWithSupabase(
        from fileName: String,
        bucketName: String = Constants.Supabase.storageBucket
    ) async throws -> Data {
        guard !fileName.isEmpty else {
            throw NSError(
                domain: "SupabaseManager",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Имя файла пустое"]
            )
        }
        
        let data = try await client.storage
            .from(bucketName)
            .download(path: fileName)
        
        return data
    }
    
    //Appointment
    func fetchAllAppointmentsWithSupabase() async throws -> [Appointment] {
        let appointments: [Appointment] = try await client
            .from("appointments")
            .select()
            .order("appointment_date", ascending: false)
            .execute()
            .value
        
        return appointments
    }
    
    /// Сохранение записи
    func saveAppointmentWithSupabase(_ appointment: Appointment) async throws {
        _ = try await client
            .from("appointments")
            .insert(appointment)
            .execute()
    }
    
    /// Удаление записи
    /// - Parameter id: ID записи для удаления
    func deleteAppointmentWithSupabase(id: UUID) async throws {
        _ = try await client
            .from("appointments")
            .delete()
            .eq("id", value: id.uuidString)
            .execute()
    }
}
