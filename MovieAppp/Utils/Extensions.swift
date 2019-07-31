//
//  Extensions.swift
//  MovieAppp
//
//  Created by Barış Ertaş on 27.07.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//


import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        
    }
    
    static func mainColor() -> UIColor {
        return UIColor.rgb(red: 123, green: 104, blue: 238)
    }
    
}


extension UIView {
    
    func center(inView view: UIView){
        self.translatesAutoresizingMaskIntoConstraints = true
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

extension UIImageView{
    
    func setImage(with url: String){
        guard let imageURL = URL(string: url) else { return }
        setImage(with: imageURL)
    }
    
   private func setImage(with url: URL){
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil,
                let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        dataTask.resume()
    }
}


