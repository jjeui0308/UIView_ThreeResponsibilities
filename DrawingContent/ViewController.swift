//
//  ViewController.swift
//  DrawingContent
//
//  Created by Justin Ji on 07/05/2018.
//  Copyright © 2018 Justin Ji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //UIKit Content
    let triangleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Triangle").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .yellow
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //Core Graphics Content
    lazy var customTriangleView: CustomTriangleView = {
        let view = CustomTriangleView()
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTouchEvent)))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    @objc func handleTouchEvent() {
        makeViewBounce(view: customTriangleView)
    }
    
    func makeViewBounce(view: UIView) {
        UIView.animate(withDuration: 0.5) {
            view.transform = CGAffineTransform(scaleX: 2.8, y: 2.8)
            view.transform = .identity
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(triangleImageView)
        view.addSubview(customTriangleView)
        
        NSLayoutConstraint.activate([
            
            triangleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            triangleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            triangleImageView.widthAnchor.constraint(equalToConstant: 25),
            triangleImageView.heightAnchor.constraint(equalToConstant: 25),
            
            customTriangleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customTriangleView.topAnchor.constraint(equalTo: triangleImageView.bottomAnchor, constant: 30),
            customTriangleView.widthAnchor.constraint(equalToConstant: 25),
            customTriangleView.heightAnchor.constraint(equalToConstant: 25),
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}


class CustomTriangleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        //drawing a triangle on the view's layer
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.minY))
        context.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        context.addLine(to: CGPoint(x: (rect.maxX), y: rect.maxY/2))
        context.closePath()
        context.setFillColor(UIColor.yellow.cgColor)
        context.fillPath()
    }
}

































































