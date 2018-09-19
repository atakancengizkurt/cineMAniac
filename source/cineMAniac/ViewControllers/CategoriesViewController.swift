//
//  CategoriesViewController.swift
//  cineMAniac
//
//  Created by Glny Gl on 10.09.2018.
//  Copyright © 2018 Glny Gl. All rights reserved.
//

import UIKit
import Alamofire

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesCW: UICollectionView!
    
    var movieGenre: Genre?
    
    override func viewDidLoad() {
        super.viewDidLoad()

      /*  let widthSize = UIScreen.main.bounds.width/3-4
        let heightSize = UIScreen.main.bounds.height/3-4
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: widthSize, height: heightSize)
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        
        //categoriesCW.collectionViewLayout = layout
       */
        
        self.getJSON()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.isHidden = true
//    }
    
    enum MovieBanner: String {
        case Action
        case Adventure
        case Animation
        case Comedy
        case Crime
        case Documentary
        case Drama
        case Family
        case Fantasy
        case History
        case Horror
        case Music
        case Mystery
        case Romance
        case ScienceFiction
        case Thriller
        case TVMovie
        case War
        case Western
        case Default
    }
    
    func getJSON(){

        Alamofire.request("https://api.themoviedb.org/3/genre/movie/list?api_key=b155b3b83ec4d1cbb1e9576c41d00503&language=en-US").responseJSON { (response) -> Void in
            
            if response.result.isFailure {
                print("Error")
            } else {
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let jData = try decoder.decode(Genre.self, from: data)
                    DispatchQueue.main.async {
                        self.movieGenre = jData
                        self.categoriesCW.reloadData()
                    }
                } catch let err {
                    print("Err", err)
                }
            }
        }
    }
    
    func nameTrim(_ name: String) -> String {
        
        let trimmed = name.replacingOccurrences(of: " ", with: "")
        return trimmed
    }
    
    func getImage(_ genreName: MovieBanner, _ cell: CategoryCellClass){
        switch genreName {
        case .Action:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Adventure:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Animation:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Comedy:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Crime:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Documentary:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Drama:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Family:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Fantasy:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .History:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Horror:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Music:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Mystery:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Romance:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .ScienceFiction:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Thriller:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .TVMovie:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .War:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        case .Western:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
       case .Default:
            let image = UIImage.init(named: genreName.rawValue)
            cell.cellImage.image = image
        }
    }
    
    
}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieGenre?.genres?.count ?? 0 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCellClass", for: indexPath) as! CategoryCellClass
        
        if let category = self.movieGenre?.genres?[indexPath.row]
        {
            cell.cellName.text = category.name
            let str = nameTrim(category.name ?? "")
            if let categoryEnum: MovieBanner = MovieBanner(rawValue: str)
            {
                getImage(categoryEnum, cell)
            }else
            {
                getImage(.Default, cell)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let navStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let genreViewController = navStoryboard.instantiateViewController(withIdentifier: "GenreViewControllerID") as! GenreViewController
        
        if let category = self.movieGenre?.genres?[indexPath.row]
        {
            let id = category.id
            genreViewController.genreID = id
            genreViewController.categoryName = category.name!
        }
        
        self.navigationController?.pushViewController(genreViewController, animated: true)
    }
    
}


