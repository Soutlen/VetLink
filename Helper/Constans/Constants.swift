
import UIKit

enum Constants {
    
    enum Supabase {
        static let baseURL = "https://ridroffucrsgpxiugdmu.supabase.co"
        static let apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJpZHJvZmZ1Y3JzZ3B4aXVnZG11Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMyODIzODksImV4cCI6MjA3ODg1ODM4OX0.GTlbo9cbQ0f-5DP4suvN0pro8lG90ZEY1M9qaY93TIc"
        static let storageBucket = "doctor-photos"
        static let storagePath = "doctors_photo"
        
        static var supabaseURL: URL {
            guard let url = URL(string: baseURL) else {
                fatalError("Invalid Supabase URL")
            }
            return url
        }
    }
    
    enum UI {
        static let cornerRadius: CGFloat = 16
        static let cellImageHeight: CGFloat = 300
        static let defaultSpacing: CGFloat = 16
        static let smallSpacing: CGFloat = 12
    }
    
    enum Images {
        static let placeholderPerson = "person.circle.fill"
    }
}
