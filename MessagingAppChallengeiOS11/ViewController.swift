//
//  ViewController.swift
//  MessagingAppChallengeiOS11
//
//  Created by Marc Stroebel on 3/7/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: MessageListViewModelProtocol
    private let collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "standard")
        collection.register(MessageCollectionViewCell.self, forCellWithReuseIdentifier: "messageCell")
        return collection
    }()
    
    required init?(coder: NSCoder) {
        self.viewModel = MessageListViewModel()
        super.init(coder: coder)
        self.viewModel.onMessagesUpdated = { [weak self] messages in
            self?.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.blue
        
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "messageCell", for: indexPath) as! MessageCollectionViewCell
        cell.setupCell(message: viewModel.messages[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 100)
    }
}
