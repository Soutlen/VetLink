import Foundation

enum ImageURLHelper {
    
    static func makeImageURL(fileName: String) -> String {
        let bucketPath = "\(Constants.Supabase.storageBucket)/\(Constants.Supabase.storagePath)"
        return "\(Constants.Supabase.baseURL)/storage/v1/object/public/\(bucketPath)/\(fileName)"
    }
} 
