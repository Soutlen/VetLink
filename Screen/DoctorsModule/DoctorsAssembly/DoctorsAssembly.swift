
import UIKit
import Supabase

enum DoctorsAssembly {
    
    static func build() -> UIViewController {
        
        let supabaseClient = SupabaseClient(
            supabaseURL: Constants.Supabase.supabaseURL,
            supabaseKey: Constants.Supabase.apiKey
        )
        
        let supabase = SupabaseManager(client: supabaseClient)
        let model = DoctorsModel(supabaseManager: supabase)
        let interactor = DoctorsInteractor(model: model)
        let view = DoctorsViewController()
        let router = DoctorsRouter(viewController: view)
        
        let presenter = DoctorsPresenter(
            interactor: interactor,
            view: view,
            router: router
        )
        
        view.presenter = presenter
        interactor.output = presenter
        
        let navigationController = UINavigationController(rootViewController: view)
        
        return navigationController
    }
}
