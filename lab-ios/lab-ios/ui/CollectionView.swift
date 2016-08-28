
import Foundation
import UIKit

class CollCellView: UICollectionViewCell {
    var imageView: UIImageView!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let w = Double(UIScreen.main.bounds.size.width)
        
        imageView = UIImageView(
            frame: CGRect(
                x: 0, y: 0,
                width: w / 3 - 10.0,
                height: w / 3 - 10.0
            )
        )
        
        self.addSubview(imageView)
        
        titleLabel = UILabel(
            frame: CGRect(
                x: 0, y: 0,
                width: w / 3 - 10.0,
                height: 40
            )
        )
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.orange
        
        self.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.gray

        let collView = self.initCollView()
        
        view.addSubview(collView)

        collView.addSubview(self.getBackBtn())
    }
    
    func initLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 40, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 5
        
        layout.itemSize = CGSize(
            width: CGFloat(view.frame.width) / 3 - 10,
            height: CGFloat(view.frame.height) / 3 - 10
        )
        
        layout.headerReferenceSize = CGSize(
            width: view.frame.width, height: 40
        )
        
        layout.footerReferenceSize = CGSize(
            width: view.frame.width, height: 40
        )
        
        return layout
    }
    
    func initCollView() -> UICollectionView {
        let layout = self.initLayout()
        
        let collView = UICollectionView(
            frame: CGRect(
                x: 0, y: 20,
                width: view.frame.width,
                height: view.frame.height
            ),
            collectionViewLayout: layout
        )

        collView.register(CollCellView.self, forCellWithReuseIdentifier: "Cell")
        collView.register(UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: "Header")
        collView.register(UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionElementKindSectionFooter,
            withReuseIdentifier: "Footer")
        
        collView.delegate = self
        collView.dataSource = self
        
        return collView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollCellView
        
        cell.imageView?.image = UIImage(named: "asset/avatar.jpg")
        cell.titleLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("section \(indexPath.row)")
    }

    func getBackBtn() -> UIButton {
        let backBtn = UIButton() { b in
            b.title = "back"
            b.radius = 5
            b.frame = CGRect(x: 10, y: 0, width: 40, height: 30)

            b.addTarget(self, action: #selector(CollectionView.gotoMain), for: .touchUpInside)
        }

        return backBtn
    }

    func gotoMain() {
        let mainView = ViewController()
        mainView.backFrom = "collection view"
        navigationController?.pushViewController(mainView, animated: true)
    }
}
