//
//  PostListViewController.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import UIKit

// MARK: - PostListViewProtocol
protocol PostListViewProtocol: AnyObject {
    func showListPost(post: [PostResponse], userId: Int)
    func showProgressView()
    func hideProgressView()
}

class PostListViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var listPostTableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - Properties
    var presenter: PostListPresenterProtocol?
    var postListConfigurator: PostListConfiguratorProtocol?
    var refresh: UIRefreshControl!
    var listUserDetail: UserResponse?
    var arrayPostList: [PostResponse]? = []
    var showId: PostResponse?
    var userContactId: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupRefreshService()
        setupView()
    }
    
    //MARK: - Functions
    private func configureListPost() {
        postListConfigurator = PostListConfigurator()
        postListConfigurator?.configurePostListView(viewController: self)
    }
    
    private func setupView() {
        guard let user = listUserDetail else {
            return
        }
        nameLabel.text = user.name
        phoneLabel.text = user.phone
        emailLabel.text = user.email
        userContactId = user.id
        configureListPost()
        presenter?.getPostList(userId: userContactId)
    }
    
    private func setupRefreshService() {
        self.refresh = UIRefreshControl()
        self.listPostTableView.alwaysBounceVertical = true
        self.refresh?.tintColor = UIColor.gray
        self.refresh?.backgroundColor = UIColor.white
        self.refresh?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        self.refresh?.attributedTitle = NSAttributedString(string: NSLocalizedString("refreshData", comment: "refreshData"), attributes: attributes)
        self.listPostTableView.addSubview(refresh)
    }
    
    @objc func refreshData() {
        DispatchQueue.main.async {
            self.listPostTableView.reloadData()
        }
        stopRefreshData()
    }
    
    private func stopRefreshData() {
        self.refresh?.endRefreshing()
    }
    
    private func setupTableView() {
        listPostTableView.delegate = self
        listPostTableView.dataSource = self
        listPostTableView.register(UINib(nibName: PostListTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: PostListTableViewCell.nibName)
        listPostTableView.separatorStyle = .none
    }
    
    // MARK: - IBActions
    @IBAction func didTapBack(_ sender: UIButton) {
        presenter?.goToBack()
    }
}

// MARK: - UITableViewDelegate - UITableViewDataSource
extension PostListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rowListUser = arrayPostList {
            return rowListUser.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listPostTableView.dequeueReusableCell(withIdentifier: PostListTableViewCell.nibName, for: indexPath) as? PostListTableViewCell
        cell?.titleLabel.text = arrayPostList?[indexPath.row].title
        cell?.bodyLabel.text = arrayPostList?[indexPath.row].body
        cell?.layer.cornerRadius = 10
        cell?.backgroundColor = UIColor.clear
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PostListTableViewCell.sizePostList
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

// MARK: - PostListViewProtocol
extension PostListViewController: PostListViewProtocol {
    func showListPost(post: [PostResponse], userId: Int) {
        arrayPostList = post
        userContactId = userId
        listPostTableView.reloadData()
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
