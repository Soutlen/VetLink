import UIKit

final class ImageCacheManager {
    
    static let shared = ImageCacheManager()
    
    private let urlSession: URLSession
    
    private init() {
        urlSession = URLSession.shared
    }
    
    func getImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        downloadImage(from: urlString, completion: completion)
    }

    private func downloadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        urlSession.dataTask(with: url) { data, _, error in
            if let error = error {
                print("ImageCacheManager: Ошибка загрузки - \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("ImageCacheManager: Не удалось создать UIImage из данных")
                completion(nil)
                return
            }
            
            completion(image)
        }.resume()
    }
}
