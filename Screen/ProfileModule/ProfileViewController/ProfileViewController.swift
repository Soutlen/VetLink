import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileView = ProfileView()
    
    private let settingsSections: [[String]] = [
        ["Тема", "Privacy Policy", "Terms of Use"],
        ["Rate Us", "How to Use"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        setupTableView()
    }
    
    override func loadView() {
        view = profileView
    }
    
    private func setupTableView() {
        profileView.tableView.delegate = self
        profileView.tableView.dataSource = self
        profileView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = settingsSections[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = item
        
        if item == "Тема" {
            cell.detailTextLabel?.text = nil
            cell.accessoryType = .none
            cell.selectionStyle = .none
            
            let themeSwitch = UISwitch()
            themeSwitch.isOn = ThemeManager.shared.isDarkMode
            themeSwitch.addTarget(self, action: #selector(themeSwitchChanged(_:)), for: .valueChanged)
            cell.accessoryView = themeSwitch
        } else {
            cell.detailTextLabel?.text = nil
            cell.accessoryType = .disclosureIndicator
            cell.accessoryView = nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = settingsSections[indexPath.section][indexPath.row]
        
        if item == "Тема" {
            return
        }
    }
    
    @objc private func themeSwitchChanged(_ sender: UISwitch) {
        let newTheme: AppTheme = sender.isOn ? .dark : .light
        ThemeManager.shared.setTheme(newTheme)
    }
}
