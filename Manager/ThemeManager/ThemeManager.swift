import UIKit

enum AppTheme: String, CaseIterable {
    case light = "light"
    case dark = "dark"
    
    var userInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    
    var displayName: String {
        switch self {
        case .light:
            return "Светлая"
        case .dark:
            return "Тёмная"
        }
    }
}

final class ThemeManager {
    
    static let shared = ThemeManager()
    
    private let themeKey = "selectedTheme"
    
    static let themeDidChangeNotification = Notification.Name("themeDidChange")
    
    private init() {}
    
    var currentTheme: AppTheme {
        if let themeString = UserDefaults.standard.string(forKey: themeKey),
           let theme = AppTheme(rawValue: themeString) {
            return theme
        }
        return .light
    }
    
    var isDarkMode: Bool {
        return currentTheme == .dark
    }
    
    func setTheme(_ theme: AppTheme) {
        UserDefaults.standard.set(theme.rawValue, forKey: themeKey)
        applyTheme(theme)
        NotificationCenter.default.post(name: ThemeManager.themeDidChangeNotification, object: theme)
    }
    
    func applyTheme(_ theme: AppTheme) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.forEach { window in
                window.overrideUserInterfaceStyle = theme.userInterfaceStyle
            }
        }
    }
    
    func applySavedTheme() {
        let theme = currentTheme
        applyTheme(theme)
    }
}
