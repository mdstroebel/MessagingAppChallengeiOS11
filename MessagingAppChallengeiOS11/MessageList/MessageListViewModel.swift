//
//  MessageListViewModel.swift
//  MessagingAppChallenge
//
//  Created by Marc Stroebel on 3/7/2022.
//

import Foundation

protocol MessageListViewModelProtocol {
    var onMessagesUpdated: (([MessageModel]) -> Void)? { get set }
    var messages: [MessageModel] { get }
    func fetchMessages()
}

class MessageListViewModel {
    private var dataManager: DataManagerProtocol
    var onMessagesUpdated: (([MessageModel]) -> Void)?
    public var messages: [MessageModel] = []
    
    init(dataManager: DataManagerProtocol = MessageListDataManager.shared, onMessagesUpdated: (([MessageModel]) -> Void)? = nil) {
        self.dataManager = dataManager
        self.onMessagesUpdated = onMessagesUpdated
        
        self.fetchMessages()
        self.dataManager.onMessagesUpdated = { [weak self] messages in
            DispatchQueue.main.async {
                guard let self = self else {
                    return
                }
                
                self.messages = messages
                self.onMessagesUpdated?(self.messages)
            }
        }
    }
}

extension MessageListViewModel: MessageListViewModelProtocol {
    func fetchMessages() {
        messages = self.dataManager.fetchData()
    }
}
