//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Daria on 21.02.2024.
//

import UIKit

class FollowerListVC: UIViewController {
    //MARK: - Enum
    enum Section { case main }
    //MARK: - Property
    var username: String!
    var foloowers: [Follower] = []
    var page = 1
    var hasMoreFollowers = true
    
    var collectionView: UICollectionView!
    var dataSourse: UICollectionViewDiffableDataSource<Section, Follower>!
    //MARK: - Life cycle view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        configureDataSourse()
        getFollowes(usermane: username, page: page)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    //MARK: - Configure func
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reiseID)
    }
        
    func configureDataSourse() {
        dataSourse = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reiseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    //MARK: - Data func
    func getFollowes(usermane: String, page: Int) {
        NetworkManager.shared.getFollowers(for: username, page: page) {[weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let followers):
                if followers.count < 100 { self.hasMoreFollowers = false }
                self.foloowers.append(contentsOf: followers)
                self.updateData()
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", messeage: error.rawValue, buttonTitle:"OK")
            }
        }
    }
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(foloowers)
        DispatchQueue.main.async { self.dataSourse.apply(snapshot, animatingDifferences: true) }
        
    }
}

extension FollowerListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            page += 1
            getFollowes(usermane: username, page: page)
        }
    }
}
