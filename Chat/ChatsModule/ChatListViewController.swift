//
//  ChatListViewController.swift
//  Chat
//
//  Created by Илья Павлов on 03.06.2026.
//

import UIKit

final class ChatListViewController: UIViewController {

    private let searchController = UISearchController(searchResultsController: nil)

    private lazy var chatsCollectionView: UICollectionView = {
        let layout = createCompositionalLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        return collectionView
    }()

    private var dataSource: UICollectionViewDiffableDataSource<ChatSections, ChatListModel>?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupDataSource()
        applySnapshot()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureBottomSearchBar()
    }
}

// MARK: - SetupUI
private extension ChatListViewController {
    func setupUI() {
        navigationItem.title = "Chats"
        view.addSubview(chatsCollectionView)
        NSLayoutConstraint.activate([
            chatsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            chatsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func configureBottomSearchBar() {
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }
}

// MARK: - Setup Data Source
private extension ChatListViewController {
    
    func setupDataSource() {
        let waitingCell = UICollectionView.CellRegistration<UICollectionViewCell, ChatListModel> { cell, _, item in
            cell.contentConfiguration = WaitingChatCell.contentConfiguration(for: item)
            cell.applyRoundedStyle()
        }
        
        let waitingCellSupplementary = UICollectionView.SupplementaryRegistration<TitleSupplementaryView>(
            elementKind: UICollectionView.elementKindSectionHeader
        ) { supplementaryView, _, _ in
            supplementaryView.label.text = "Waiting Chats"
        }
        
        let activeCell = UICollectionView.CellRegistration<UICollectionViewCell, ChatListModel> { cell, _, item in
            cell.contentConfiguration = ActiveChatCell.contentConfiguration(for: item)
            cell.applyRoundedStyle()
        }
        
        let activeCellSupplementary = UICollectionView.SupplementaryRegistration<TitleSupplementaryView>(
            elementKind: UICollectionView.elementKindSectionHeader
        ) { supplementaryView, _, _ in
            supplementaryView.label.text = "Active Chats"
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: chatsCollectionView) { [weak self] collectionView, indexPath, item in
            guard let self else { fatalError("ChatListViewController was deallocated") }
            let section = section(for: indexPath.section)
            switch section {
            case .waitingChats:
                return collectionView.dequeueConfiguredReusableCell(using: waitingCell, for: indexPath, item: item)
            case .activeChats:
                return collectionView.dequeueConfiguredReusableCell(using: activeCell, for: indexPath, item: item)
            }
        }
        
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let self else { fatalError("ChatListViewController was deallocated") }
            guard kind == UICollectionView.elementKindSectionHeader else { return nil }

            let section = section(for: indexPath.section)
            switch section {
            case .waitingChats:
                return chatsCollectionView.dequeueConfiguredReusableSupplementary(using: waitingCellSupplementary, for: indexPath)
            case .activeChats:
                return chatsCollectionView.dequeueConfiguredReusableSupplementary(using: activeCellSupplementary, for: indexPath)
            }
        }
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        let snapshot = makeSnapshot(from: ChatListModel.mock)
        dataSource?.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    func section(for index: Int) -> ChatSections {
        guard let dataSource else {
            fatalError("DataSource is not configured")
        }
        let snapshot = dataSource.snapshot()
        let sectionIdentifiers = snapshot.sectionIdentifiers
        return sectionIdentifiers[index]
    }
    
    func makeSnapshot(from chats: [ChatListModel]) -> NSDiffableDataSourceSnapshot<ChatSections, ChatListModel> {
        var snapshot = NSDiffableDataSourceSnapshot<ChatSections, ChatListModel>()
        let waiting = chats.filter { $0.state == .waiting }
        let active = chats.filter { $0.state == .active }
        
        if !waiting.isEmpty {
            snapshot.appendSections([.waitingChats])
            snapshot.appendItems(waiting, toSection: .waitingChats)
        }
        if !active.isEmpty {
            snapshot.appendSections([.activeChats])
            snapshot.appendItems(active, toSection: .activeChats)
        }
        return snapshot
    }
}

// MARK: - Setup CollectionView
private extension ChatListViewController {
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self else { fatalError("ChatListViewController was deallocated") }
            let section = section(for: sectionIndex)
            switch section {
            case .waitingChats:
                return createWaitngChats()
            case .activeChats:
                return createActiveChats()
            }
        }
        
        return layout
    }
    
    func createWaitngChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(Layout.Chats.waitingChats.groupSize),
            heightDimension: .absolute(Layout.Chats.waitingChats.groupSize)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = Layout.Spacing.m
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.boundarySupplementaryItems = [makeSectionHeader()]
        section.contentInsets = .init(
            top: Layout.Spacing.m,
            leading: Layout.Spacing.m,
            bottom: Layout.Spacing.m,
            trailing: Layout.Spacing.m
        )
        return section
    }
    
    func createActiveChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(Layout.Chats.activeChats.groupHeight)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = Layout.Spacing.s
        section.boundarySupplementaryItems = [makeSectionHeader()]
        section.contentInsets = .init(
            top: Layout.Spacing.m,
            leading: Layout.Spacing.m,
            bottom: Layout.Spacing.m,
            trailing: Layout.Spacing.m
        )
        return section
    }

    func makeSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading
        )
    }
}

// MARK: - UISearchBarDelegate
extension ChatListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

extension ChatListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

#Preview {
    MainTabBarFactory.makeController()
}
