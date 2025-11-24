import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let tabBarController = TabBarController()
        window.rootViewController = tabBarController
        
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        if let tabBarController = window?.rootViewController as? UITabBarController {
            UserDefaults.standard.set(tabBarController.selectedIndex, forKey: "selectedTabIndex")
        }
    }
}
