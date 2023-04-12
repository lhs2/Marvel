//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Luiz Henrique on 12/04/2023.
//

import Foundation


final class HomeViewModel: ViewModelProtocol {
    var onLoadViewsCompletedEvent: (() -> Void)?
    
    var onFetchDataCompleted: ((Bool, String?) -> Void)?
    
    func fetchData() {
    }
    
    func loadViews() {
    }
    
}
