//
//  HeroListViewController.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

final class HeroListViewController: UIViewController {
    
    private let titleView: UIView = {
        let view = TitleView()
        view.configure(TitleViewModel.defaultTitle)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.backgroundColor = .white
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: self.layoutSection(forIndex:environment:))
        return layout
    }
    
    private func layoutSection(forIndex index: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let desiredWidth: CGFloat = UIScreen.main.bounds.width - 32
        let minimumItemCount = 1.0
        let maximumItemCount = 2.0
        
        let calculatedItemCount = environment.container.effectiveContentSize.width / desiredWidth
        let itemCount = max(min(calculatedItemCount, maximumItemCount), minimumItemCount)
        
        let fractionWidth: CGFloat = 1 / (itemCount.rounded())
        
        let estimation = NSCollectionLayoutDimension.estimated(desiredWidth)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fractionWidth),
                                              heightDimension: estimation)
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: estimation)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: Int(itemCount))
        group.interItemSpacing = .fixed(16)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 10, leading: 16, bottom: 40, trailing: 16)
        
        return section
    }
    
        
    var coordinator: HeroListCoordinator?
    var viewModel: HeroListViewModelProtocol
    
    init(viewModel: HeroListViewModelProtocol = HeroListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        self.title = "Hero List"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.clipsToBounds = true
        setupCollectionView()
        updateConstraint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoading()
        requestItens()
    }
    
    @objc func stop() {
        viewModel.stopLoading?()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
    }
    
    private func setupLoading() {
        viewModel.onLoading = { [weak self] in
            self?.showLoading()
        }
        
        viewModel.stopLoading = {  [weak self] in
            self?.stopLoading()
        }
    }
        
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(HeroItemCollectionViewCell.self, forCellWithReuseIdentifier: HeroItemCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.layer.backgroundColor = UIColor.white.cgColor
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(titleView)
        view.addSubview(searchBar)
        searchBar.delegate = self
        view.addSubview(collectionView)
    }
    
    
    private func updateConstraint() {
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}

extension HeroListViewController: Coordinated {
    
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? HeroListCoordinator
    }
}

extension HeroListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfHeroes
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroItemCollectionViewCell.identifier, for: indexPath)
        guard let heroItemCell = cell as? HeroItemCollectionViewCell else {
            return cell
        }
        
        let item = viewModel.getItemFor(indexPath: indexPath)
        heroItemCell.configure(item, collectionWidth: collectionView.frame.width)
        return heroItemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if (offsetY > contentHeight - scrollView.frame.height * 4) {
            requestItens(isPagination: true)
        }
    }

}

/// Request about itens
extension HeroListViewController {
    func requestItens(isPagination: Bool = false) {
        let completionBlock: HeroListViewModel.GetHeroListCompletionBlock = { [weak self] result in
            switch result {
            case .success(let shouldReloadCollectionView):
                if shouldReloadCollectionView {
                    self?.reloadCollectionView()
                }
            case .failure(_):
                fatalError("error case not implemented")
            }
        }
        
        if isPagination {
            viewModel.fetchPaginationItems(completion: completionBlock)
            return
        }
        viewModel.fetchItems(with: "", completion: completionBlock)
        
        
    }
    
    private func individualReload(with indexPath: IndexPath) {
        self.collectionView.reloadItems(at: [indexPath])
    }
    
}


extension HeroListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        guard let filterName = searchBar.text else {
            return
        }
        viewModel.getHeroList(with: filterName) { [weak self] response in
            if response {
                self?.reloadCollectionView()
                self?.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        viewModel.getHeroList(with: "") { [weak self] response in
            if response {
                self?.reloadCollectionView()
                self?.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
            }
        }
    }
    
     func reloadCollectionView() {
        DispatchQueue.main.async{ [weak self] in
            self?.collectionView.reloadData()
        }
    }

}

