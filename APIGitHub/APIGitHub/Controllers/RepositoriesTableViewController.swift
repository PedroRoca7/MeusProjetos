//
//  RepositoriesTableViewController.swift
//  APIGitHub
//
//  Created by Pedro Henrique on 11/04/23.
//

import UIKit

class RepositoriesTableViewController: UITableViewController {

    var repositories: [Repository] = []
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    var loadingRepos = false
    var total = 0
    var currentPage: Int = 1
    
    // MARK: - Life cycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Buscando Repositórios. Aguarde..."
        loadRepositories()
    }

    // MARK: - Private method
    
    private func loadRepositories() {
        loadingRepos = true
        APIGithub.loadRepositories(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            
            if let result = result {
                self.repositories += result.items
                self.total = result.totalCount
                print("Total:", self.total, "Já incluidos", self.repositories.count)
                DispatchQueue.main.async {
                    self.label.text = "Não foram encontrados repositórios"
                    self.tableView.reloadData()
                }
            }
        
            self.loadingRepos = false
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        tableView.backgroundView = repositories.count == 0 ? label : nil
        return repositories.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! RepositoryViewController
        vc.repository = repositories[tableView.indexPathForSelectedRow!.row]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepositorieTableViewCell

        let repos = repositories[indexPath.row]
        cell.prepareCell(with: repos)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == repositories.count - 10 && !loadingRepos && repositories.count != total{
            currentPage += 1
            loadRepositories()
        }
    }
}
