
import UIKit

final class ImageCacheManager {
    
    static let shared = ImageCacheManager()
    
    private let urlSession: URLSession
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil
        urlSession = URLSession(configuration: configuration)
    }
    
    func getImage(from urlString: String, fileName: String) async -> UIImage? {
        return await downloadImage(from: urlString)
    }

    private func downloadImage(from urlString: String) async -> UIImage? {
        
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, response) = try await urlSession.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse {
                guard (200...299).contains(httpResponse.statusCode) else {
                    print("ImageCacheManager: HTTP ошибка \(httpResponse.statusCode) для URL: \(urlString)")
                    return nil
                }
            }
            
            guard let image = UIImage(data: data) else {
                print("ImageCacheManager: Не удалось создать UIImage из данных")
                return nil
            }
            
            return image
        } catch {
            print("ImageCacheManager: Ошибка загрузки - \(error.localizedDescription)")
            return nil
        }
    }
}
