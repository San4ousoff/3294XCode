//
//  SettingsViewController.swift
//  HW4
//
//  Created by Mac on 20.12.2023.
//

import UIKit

class SettingsViewController: UICollectionViewController {

    private let reuseIdentifier = "ThemeCell"
    private let themes: [AppTheme] = [.standard, .gray, .dark]
    var ownerID: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        let theme = themes[indexPath.item]
        cell.backgroundColor = theme.backgroundColor
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let ownerID = ownerID else {
            // обработка ситуации, когда ownerID отсутствует
            return
        }
        let selectedTheme = themes[indexPath.item]
        UserDefaults.standard.setAppTheme(selectedTheme, forOwnerID: ownerID)
        applyAppWideTheme(selectedTheme)
    }

    private func applyAppWideTheme(_ theme: AppTheme) {
        guard let window = UIApplication.shared.windows.first else { return }
        window.overrideUserInterfaceStyle = (theme == .dark) ? .dark : .light
    }

}



