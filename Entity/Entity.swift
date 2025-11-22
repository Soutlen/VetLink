
import Foundation

protocol IDoctorsModel {
    func getAllDoctors() async throws -> [Doctor]
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

struct User {
    let id: String
    let email: String
    let name: String
}

final class DoctorsModel: IDoctorsModel {
    private let supabaseManager: SupabaseManager
    
    init(supabaseManager: SupabaseManager) {
        self.supabaseManager = supabaseManager
    }
    
    func getAllDoctors() async throws -> [Doctor] {
        try await supabaseManager.fetchAllDoctorsWithSupabase()
    }
}

struct Appointment: Codable, Identifiable {
    let id: UUID
    let doctorId: UUID
    let doctorName: String
    let doctorSpecialty: String
    let appointmentDate: Date
    let appointmentTime: String
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case doctorId = "doctor_id"
        case doctorName = "doctor_name"
        case doctorSpecialty = "doctor_specialty"
        case appointmentDate = "appointment_date"
        case appointmentTime = "appointment_time"
        case createdAt = "created_at"
    }
}

protocol IAppointmentsModel {
    func getAllAppointments() async throws -> [Appointment]
}

final class AppointmentsModel: IAppointmentsModel {
    private let supabaseManager: SupabaseManager
    
    init(supabaseManager: SupabaseManager) {
        self.supabaseManager = supabaseManager
    }
    
    func getAllAppointments() async throws -> [Appointment] {
        try await supabaseManager.fetchAllAppointmentsWithSupabase()
    }
}
