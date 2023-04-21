//
//  LoadingView.swift
//  Marvel
//
//  Created by Luiz Henrique on 19/04/2023.
//

import UIKit

class LoadingView: UIView {
    
    private var isAnimating = false
    private var isCurrentlyDarkImage = false
    
    var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "loading")
        imageView.tag = 11
        imageView.layer.cornerRadius = 9
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(imageView)
        addConstraints()
        perform(#selector(startAnimatingBlack), with: nil, afterDelay: 0)
    }
    
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    @objc func startAnimatingRed() {
        
        UIView.transition(with: imageView, duration: 1, options: .transitionCrossDissolve, animations: ({
            self.imageView.image = #imageLiteral(resourceName: "loading")
        })) { _ in
            self.perform(#selector(self.startAnimatingBlack), with: nil, afterDelay: 0)
        }
    }
        
    @objc func startAnimatingBlack() {
        UIView.transition(with: imageView, duration: 1, options: .transitionCrossDissolve, animations: ({
            self.imageView.image = #imageLiteral(resourceName: "loadingDark")
        })) { _ in
            self.perform(#selector(self.startAnimatingRed), with: nil, afterDelay: 0)
        }
        
    }
    
    func stopLoading(){
        DispatchQueue.main.async { [weak self] in
            UIImageView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseIn, animations: {
                self?.imageView.alpha = 0.0
            } ) { _ in
                self?.removeFromSuperview()
            }
        }
    }
    
}
