//
//  ViewController.swift
//  WeatherApp
//
//  Created by Alexander Airumyan on 08.08.2021.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - Private Properties
	
	private let componentOne = ComponentOneView()
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		backgroundView()
		setupConstraints()
		
		configureComponentOneView()
	}
	
	func backgroundView() {
		
		let view = UILabel()
		view.frame = CGRect(x: 0, y: 0, width: 800, height: 1200)
		view.backgroundColor = .white
		let layer0 = CAGradientLayer()
		
		layer0.colors = [
			UIColor(red: 0.945, green: 0.694, blue: 0.294, alpha: 1).cgColor,
			UIColor(red: 0.737, green: 0.173, blue: 0.208, alpha: 1).cgColor
		]
		
		layer0.locations = [0, 1]
		layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
		layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
		layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.03, b: -1, c: 1, d: 0.33, tx: -0.53, ty: 0.84))
		layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
		layer0.position = view.center
		view.layer.addSublayer(layer0)
		
		let parent = self.view!
		
		parent.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.widthAnchor.constraint(equalToConstant: 375).isActive = true
		view.heightAnchor.constraint(equalToConstant: 667).isActive = true
		view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 26).isActive = true
		view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 33).isActive = true
	}
}


// MARK: - Private Methods
private extension ViewController {
	func setupConstraints() {
		[componentOne].forEach { customView in
			view.addSubview(customView)
			customView.translatesAutoresizingMaskIntoConstraints = false
		}
		
		NSLayoutConstraint.activate([
			
			componentOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
											  constant: 50),
			componentOne.leadingAnchor.constraint(equalTo: view.leadingAnchor,
												  constant: 1),
			componentOne.trailingAnchor.constraint(equalTo: view.trailingAnchor,
												   constant: -2),
		])
	}
	
	func configureComponentOneView() {
		guard let weatherImage = UIImage(named: "sun") else { return }
		let city = "Краснодар"
		let status = "Ясно"
		let temp = "28"
		let date = "08 августа 2021 года"
		
		componentOne.configure(city: city, status: status, image: weatherImage, temp: temp, date: date)
	}
}
