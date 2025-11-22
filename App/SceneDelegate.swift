import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        
        window.overrideUserInterfaceStyle = ThemeManager.shared.currentTheme.userInterfaceStyle
        
        let tabBarController = TabBarController()
        window.rootViewController = tabBarController
        
        if let selectedIndex = UserDefaults.standard.object(forKey: "selectedTabIndex") as? Int,
           selectedIndex >= 0 && selectedIndex < tabBarController.viewControllers?.count ?? 0 {
            tabBarController.selectedIndex = selectedIndex
        }
        
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        if let tabBarController = window?.rootViewController as? UITabBarController {
            UserDefaults.standard.set(tabBarController.selectedIndex, forKey: "selectedTabIndex")
        }
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        ThemeManager.shared.applySavedTheme()
    }
}
