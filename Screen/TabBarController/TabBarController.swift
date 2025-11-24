import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        delegate = self
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
        tabBar.unselectedItemTintColor = .systemGray
        
        restoreSelectedTab()
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
