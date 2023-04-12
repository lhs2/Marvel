//
//  ViewModelProtocol.swift
//  Marvel
//
//  Created by Luiz Henrique on 12/04/2023.
//

protocol ViewModelProtocol {
    var onLoadViewsCompletedEvent: (()->Void)? { get }
    var onFetchDataCompleted: ((_ succeeded: Bool, _ message: String?) -> Void)? { get set }

    func fetchData()
    func loadViews()
    
}
