import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileView = ProfileView()
    
    private let settingsSections: [[String]] = [
        ["Privacy Policy", "Terms of Use"],
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
        profileView.tableView.dataSource = self
        profileView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension ProfileViewController: UITableViewDataSource {
    
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
        cell.detailTextLabel?.text = nil
        cell.accessoryType = .disclosureIndicator
        cell.accessoryView = nil
        
        return cell
    }
}
