import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        
        delegate = self
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(themeDidChange),
            name: ThemeManager.themeDidChangeNotification,
            object: nil
        )
        
        updateTabBarAppearance()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupTabBar() {
        let doctorViewController = DoctorsAssembly.build()
        doctorViewController.tabBarItem = UITabBarItem(
            title: "Врачи",
            image: UIImage(systemName: "person.2.fill"),
            selectedImage: UIImage(systemName: "person.2.fill")
        )
        
        let appointmentViewController = AppointmentsAssembly.build()
        appointmentViewController.tabBarItem = UITabBarItem(
            title: "Записи",
            image: UIImage(systemName: "calendar"),
            selectedImage: UIImage(systemName: "calendar.fill")
        )
        
        let profileViewController = ProfileAssembly.build()
        profileViewController.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(systemName: "person.circle"),
            selectedImage: UIImage(systemName: "person.circle.fill")
        )
        
        viewControllers = [doctorViewController, appointmentViewController, profileViewController]
        
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .gray
        
        updateTabBarAppearance()
        restoreSelectedTab()
    }
    
    private func updateTabBarAppearance() {
        let isDarkMode = ThemeManager.shared.isDarkMode
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            
            if isDarkMode {
                appearance.backgroundColor = .black
            } else {
                appearance.backgroundColor = .white
            }
            
            appearance.stackedLayoutAppearance.normal.iconColor = .gray
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
            
            appearance.stackedLayoutAppearance.selected.iconColor = .systemBlue
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
            
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        } else {
            if isDarkMode {
                tabBar.barTintColor = .black
            } else {
                tabBar.barTintColor = .white
            }
        }
    }
    
    @objc private func themeDidChange() {
        updateTabBarAppearance()
    }
    
    private func restoreSelectedTab() {
        if let savedIndex = UserDefaults.standard.object(forKey: "selectedTabIndex") as? Int,
           savedIndex >= 0 && savedIndex < viewControllers?.count ?? 0 {
            selectedIndex = savedIndex
        }
    }
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        UserDefaults.standard.set(selectedIndex, forKey: "selectedTabIndex")
    }
}
