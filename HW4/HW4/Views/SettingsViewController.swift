import UIKit

class SettingsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, ThemeCellDelegate {

    private let reuseIdentifier = "ThemeCell"
    private let themes: [AppTheme] = [.standard, .dark]
    var ownerID: String?
    var selectedTheme: AppTheme = .standard

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .systemBackground
        collectionView.register(ThemeCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.itemSize = CGSize(width: view.bounds.width - 20, height: 100)
            flowLayout.minimumLineSpacing = 10
            flowLayout.sectionInset = UIEdgeInsets(top: view.bounds.height/4, left: 10, bottom: view.bounds.height/4, right: 10)
        }
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return themes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ThemeCell else {
            fatalError("Unable to dequeue ThemeCell")
        }
        let theme = themes[indexPath.item]
        cell.configure(with: theme, delegate: self) 
        return cell
    }

    // MARK: ThemeCellDelegate
    func didSelectTheme(_ theme: AppTheme) {
        selectedTheme = theme
        guard let ownerID = ownerID else {
            // Обработка ситуации, когда ownerID отсутствует
            return
        }
        UserDefaults.standard.setAppTheme(theme, forOwnerID: ownerID)
        applyAppWideTheme(theme)
        collectionView.reloadData() // Перезагружаем данные коллекции, чтобы обновить отображение ячеек
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }

    private func applyAppWideTheme(_ theme: AppTheme) {
        guard let window = UIApplication.shared.windows.first else { return }
        window.overrideUserInterfaceStyle = (theme == .dark) ? .dark : .light
    }
}
