//
//  UIViewController+Extensions.swift
//  Marvel
//
//  Created by Luiz Henrique on 19/04/2023.
//

import UIKit

fileprivate var loadingView: LoadingView?

extension UIViewController {
    func showLoading() {
        if loadingView != nil {
            return
        }
        let frame = CGRect(x: self.view.center.x - 50, y: self.view.center.y-50, width: 100, height: 100)
        loadingView = LoadingView(frame: frame)
        self.view.addSubview(loadingView!)
        view.isUserInteractionEnabled = false
        
    }
    
    func stopLoading() {
        if loadingView == nil {
            return
        }
        
        loadingView?.stopLoading()
        loadingView = nil
        view.isUserInteractionEnabled = true
    }
}
