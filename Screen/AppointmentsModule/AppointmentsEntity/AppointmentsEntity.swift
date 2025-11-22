import Foundation

struct AppointmentsEntity {
    let id: UUID
    let doctorName: String
    let doctorSpecialty: String
    let date: String
    let time: String
    
    var formattedDateTime: String {
        "\(date) в \(time)"
    }
}
