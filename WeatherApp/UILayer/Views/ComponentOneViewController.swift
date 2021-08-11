//
//  ComponentOneViewController.swift
//  WeatherApp
//
//  Created by Alexander Airumyan on 08.08.2021.
//

import UIKit

class ComponentOneView: UIView {
	
	// MARK: - Private Properties
	
	private let cityName = UILabel()
	private let weatherStatus = UILabel()
	private let weatherImage = UIImageView()
	private let weatherTemp = UILabel()
	private let currentDate = UILabel()
	
	// MARK: - Initialization
	
	init() {
		super.init(frame: .zero)
		setupConstraints()
		
		setupCityName()
		setupWeatherStatus()
		setupWeatherTemp()
		setupDate()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	// MARK: - Internal Methods
	func configure(city: String,
				   status: String,
				   image: UIImage,
				   temp: String,
				   date: String) {
		cityName.text = city
		weatherStatus.text = status
		weatherImage.image = image
		weatherTemp.text = temp
		currentDate.text = date
	}
}

// MARK: - Private Methods
private extension ComponentOneView {
	func setupConstraints() {
		[cityName,
		 weatherStatus,
		 weatherImage,
		 weatherTemp,
		 currentDate].forEach { customView in
			addSubview(customView)
			customView.translatesAutoresizingMaskIntoConstraints = false
		}
		
		NSLayoutConstraint.activate([
			cityName.topAnchor.constraint(equalTo: topAnchor),
			cityName.leadingAnchor.constraint(equalTo: leadingAnchor),
			cityName.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			weatherStatus.topAnchor.constraint(equalTo: cityName.bottomAnchor,
											   constant: 25),
			weatherStatus.leadingAnchor.constraint(equalTo: leadingAnchor),
			weatherStatus.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			weatherImage.topAnchor.constraint(equalTo: weatherStatus.bottomAnchor,
											  constant: 40),
			weatherImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			weatherImage.heightAnchor.constraint(equalToConstant: 100),
			weatherImage.widthAnchor.constraint(equalToConstant: 100),
			
			weatherTemp.topAnchor.constraint(equalTo: weatherImage.bottomAnchor,
											 constant: 25),
			weatherTemp.leadingAnchor.constraint(equalTo: leadingAnchor),
			weatherTemp.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			currentDate.topAnchor.constraint(equalTo: weatherTemp.bottomAnchor,
											 constant: 25),
			currentDate.leadingAnchor.constraint(equalTo: leadingAnchor),
			currentDate.trailingAnchor.constraint(equalTo: trailingAnchor),
			currentDate.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
	func setupCityName() {
		cityName.textAlignment = .center
		cityName.numberOfLines = 1
		cityName.textColor = .white
		cityName.font = UIFont.boldSystemFont(ofSize: 36.0)
	}
	
	func setupWeatherStatus() {
		weatherStatus.textAlignment = .center
		weatherStatus.numberOfLines = 1
		weatherStatus.textColor = .white
		weatherStatus.font = UIFont.boldSystemFont(ofSize: 24)
	}
	
	func setupWeatherImage() {
		
	}
	
	func setupWeatherTemp()  {
		weatherTemp.textAlignment = .center
		weatherTemp.numberOfLines = 1
		weatherTemp.textColor = .white
		weatherTemp.font = UIFont.boldSystemFont(ofSize: 72.0)
	}
	
	func setupDate() {
		currentDate.textAlignment = .center
		currentDate.numberOfLines = 1
		currentDate.textColor = .white
		currentDate.font = UIFont.boldSystemFont(ofSize: 22.0)
	}
}
