//
//  ListUserViewController.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import UIKit

// MARK: - ListUserViewProtocol
protocol ListUserViewProtocol: AnyObject {
    func showListUser(user: [UserResponse])
    func showProgressView()
    func hideProgressView()
}

class ListUserViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var listUserTableView: UITableView!
    @IBOutlet var listUserSearchBar: UISearchBar!
    
    // MARK: - Properties
    var presenter: ListUserPresenterProtocol?
    var listUserConfigurator: ListUserConfiguratorProtocol?
    var refresh: UIRefreshControl!
    var listUserSelect: UserResponse?
    var arrayFilterListUser: [UserResponse]? = []
    var listUser: [UserResponse]? = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchBar()
        setupRefreshService()
        configureListUser()
        presenter?.getListUsers()
    }
    
    //MARK: - Functions
    private func configureListUser() {
        listUserConfigurator = ListUserConfigurator()
        listUserConfigurator?.configureListUserView(viewController: self)
    }
    
    private func setupRefreshService() {
        self.refresh = UIRefreshControl()
        self.listUserTableView.alwaysBounceVertical = true
        self.refresh?.tintColor = UIColor.gray
        self.refresh?.backgroundColor = UIColor.white
        self.refresh?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        self.refresh?.attributedTitle = NSAttributedString(string: NSLocalizedString("refreshData", comment: "refreshData"), attributes: attributes)
        self.listUserTableView.addSubview(refresh)
    }
    
    @objc func refreshData() {
        DispatchQueue.main.async {
            self.listUserTableView.reloadData()
        }
        stopRefreshData()
    }
    
    private func stopRefreshData() {
        self.refresh?.endRefreshing()
    }
    
    private func setupTableView() {
        listUserTableView.delegate = self
        listUserTableView.dataSource = self
        listUserTableView.register(UINib(nibName: ListUserTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ListUserTableViewCell.nibName)
        listUserTableView.separatorStyle = .none
    }
    
    private func setupSearchBar() {
        listUserSearchBar.delegate = self
        listUserSearchBar.placeholder = NSLocalizedString("searchUser", comment: "searchUser")
        listUserSearchBar.showsCancelButton = false
        listUserTableView.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.listUserSearchBar.showsCancelButton = false
        self.view.endEditing(true)
    }
}

// MARK: - UITableViewDelegate - UITableViewDataSource
extension ListUserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rowListUser = arrayFilterListUser {
            return rowListUser.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listUserTableView.dequeueReusableCell(withIdentifier: ListUserTableViewCell.nibName, for: indexPath) as? ListUserTableViewCell
        cell?.nameLabel.text = arrayFilterListUser?[indexPath.row].name
        cell?.phoneLabel.text = arrayFilterListUser?[indexPath.row].phone
        cell?.emailLabel.text = arrayFilterListUser?[indexPath.row].email
        cell?.layer.cornerRadius = 10
        cell?.backgroundColor = UIColor.clear
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        view.endEditing(true)
        listUserSelect = arrayFilterListUser?[indexPath.row]
        presenter?.goToPostList()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ListUserTableViewCell.sizeListUser
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset < -95 {
            self.refresh.attributedTitle = NSAttributedString(string: NSLocalizedString("successData", comment: "successData"), attributes: [NSAttributedString.Key.foregroundColor: refresh.tintColor!])
        } else {
            self.refresh.attributedTitle = NSAttributedString(string: NSLocalizedString("refreshData", comment: "refreshData"), attributes: [NSAttributedString.Key.foregroundColor: refresh.tintColor!])
        }
        self.refresh?.backgroundColor = UIColor.white
    }
}

// MARK: - UISearchBarDelegate
extension ListUserViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        arrayFilterListUser = listUser
        if searchText.isEmpty == false {
            arrayFilterListUser = listUser?.filter({ $0.name.contains(searchText)})
        }
        if self.arrayFilterListUser?.count == 0 {
            searchBar.showsCancelButton = true
            let alert = UIAlertController(title: NSLocalizedString("listIsEmpty", comment: "listIsEmpty"), message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: NSLocalizedString("accept", comment: "accept"), style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            self.listUserTableView?.reloadData()
        }
        self.listUserTableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if searchBar.isFirstResponder == true  {
            searchBar.showsCancelButton = true
            searchBar.endEditing(true)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
        guard let user = self.listUser else {
            return
        }
        showListUser(user: user)
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return filterSearch(searchBar, filterText: text, range: range)
    }
}

// MARK: - ListUserViewProtocol
extension ListUserViewController: ListUserViewProtocol {
    func showListUser(user: [UserResponse]) {
        arrayFilterListUser = user
        listUser?.insert(contentsOf: user, at: 0)
        listUserTableView.reloadData()
    }
    
    func showProgressView() {
        let progress = MBProgressHUD.showAdded(to: self.view, animated: true)
        progress.label.text = NSLocalizedString("loadData", comment: "loadData")
        progress.detailsLabel.text = NSLocalizedString("pleaseWait", comment: "pleaseWait")
        progress.isUserInteractionEnabled = false
    }
    
    func hideProgressView() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
}
