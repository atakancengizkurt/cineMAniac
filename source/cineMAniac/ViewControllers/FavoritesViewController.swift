//
//  FavoritesViewController.swift
//  cineMAniac
//
//  Created by Glny Gl on 17.09.2018.
//  Copyright © 2018 Glny Gl. All rights reserved.
//

import UIKit
import AlamofireImage

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoriteVC: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = setCollectionViewLayout()
        favoriteVC.collectionViewLayout = layout
    }

    func setCollectionViewLayout() -> UICollectionViewFlowLayout {
        let widthSize = UIScreen.main.bounds.width/3-4
        let heightSize = UIScreen.main.bounds.height/3.3-4
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: widthSize, height: heightSize)
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        return layout
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteVC.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}



extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LikedMovies.shared.likedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
        
        let movie = LikedMovies.shared.likedMovies[indexPath.row]
        cell.cellName.text = movie.title
        
        if let link = movie.poster_path {
            let imageURL = URL(string: "https://image.tmdb.org/t/p/w500" + link)
            cell.cellImage.af_setImage(withURL: imageURL!)
        }else {
            let defaultIMG = URL(string: "https://images.atomtickets.com/image/upload/h_960,q_auto/ingestion-images-archive-prod/archive/coming_soon_promo.jpg")
            cell.cellImage.af_setImage(withURL: defaultIMG!)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let navStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let movieViewController = navStoryboard.instantiateViewController(withIdentifier: "MovieDetailsVCID") as! MovieDetailsViewController
        
        movieViewController.movieResultsData = LikedMovies.shared.likedMovies[indexPath.row]
    
        self.navigationController?.pushViewController(movieViewController, animated: true)
    }
    
    
}
