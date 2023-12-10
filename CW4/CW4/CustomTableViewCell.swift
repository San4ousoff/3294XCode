//
//  CustomTableViewCell.swift
//  CW4
//
//  Created by Mac on 10.12.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    private let nameTownLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let coordsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        return view
    }()
    
    private var stackViewVertical: UIStackView
    
    private var stackViewHorisontal: UIStackView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                
        stackViewVertical = UIStackView(arrangedSubviews: [nameTownLabel, coordsLabel])
        stackViewHorisontal = UIStackView(arrangedSubviews: [circleView, stackViewVertical])
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupstackViewVertical()
        setupstackViewHorisontal()
        setupConstraints()
        circleView.layer.cornerRadius = circleView.bounds.width / 2 // закругление углов до круга
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupstackViewHorisontal(){
        stackViewHorisontal.axis = .horizontal
        stackViewHorisontal.alignment = .fill
        stackViewHorisontal.setCustomSpacing(10, after: circleView)
        contentView.addSubview(stackViewHorisontal)
    }
    
    private func setupstackViewVertical(){
        stackViewVertical.axis = .vertical
        stackViewVertical.alignment = .fill
        stackViewVertical.setCustomSpacing(10, after: nameTownLabel)
    }
    
    private func setupConstraints(){
        stackViewHorisontal.translatesAutoresizingMaskIntoConstraints = false
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackViewHorisontal.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackViewHorisontal.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackViewHorisontal.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackViewHorisontal.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor),
        ])
    }
    
    func setup(nameTown: String, lat: Double?, lon: Double?){
        nameTownLabel.text = nameTown
        guard let lat = lat else { return }
        guard let lon = lon else { return }
        coordsLabel.text = "lat: \(lat), lon: \(lon)"
        var color: UIColor
        if (lat + lon >= 100) {
            color = UIColor(red: 238/255, green: 130/255, blue: 238/255, alpha: 1)
        } else {
            color = UIColor(red: 153/255, green: 102/255, blue: 1, alpha: 1)
        }
        circleView.backgroundColor = color
    }

}
