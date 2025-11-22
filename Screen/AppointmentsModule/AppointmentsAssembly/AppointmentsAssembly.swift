import UIKit
import Supabase

enum AppointmentsAssembly {
    
    static func build() -> UIViewController {
        let supabaseClient = SupabaseClient(
            supabaseURL: Constants.Supabase.supabaseURL,
            supabaseKey: Constants.Supabase.apiKey
        )
        
        let supabase = SupabaseManager(client: supabaseClient)
        let model = AppointmentsModel(supabaseManager: supabase)
        let interactor = AppointmentsInteractor(model: model)
        let view = AppointmentsViewController()
        
        let presenter = AppointmentsPresenter(
            interactor: interactor,
            view: view
        )
        
        view.presenter = presenter
        interactor.output = presenter
        
        let navigationController = UINavigationController(rootViewController: view)
        
        return navigationController
    }
}
