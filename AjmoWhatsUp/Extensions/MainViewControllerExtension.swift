//
//  MainViewControllerExtension.swift
//  AjmoWhatsUp
//
//  Created by Matej Terek on 11/04/2021.
//

import UIKit
import Fire

extension MainViewController{
    //fetch and parse data from URL
    func loadContent(fromUrl: String){
        let f = Fire.build(HTTPMethod: .GET, url: fromUrl)
        f.onError({
            (resp, error) -> Void in
            print("Error: Network offline!")
            self.showNetworkError()
        })
        f.fireForString {
            (resultString, response) -> Void in
            if let statusCode = response?.statusCode{
                if statusCode >= 200 && statusCode <= 300{
                    // Fetcing successful show new data
                    if let result = resultString{
                        self.loadFetchedData(dataString: result )
                    }
                }
            }
            else
            {
                //Show Error message
                self.showNetworkError()
            }
        }
    }

    func loadFetchedData(dataString: String){
        DispatchQueue.main.async {
            //decode data recived from URL
            if let data: Data = dataString.data(using: .utf8){
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let response = try decoder.decode(Event.self, from: data)
                    self.eventsArray = response.data
                }
                catch {
                    print("Decoding Error : \(error)")
                    self.showNetworkError()
                }
            }
            self.mainCollectionView.reloadData()
            //Remove Loading Hud
            self.indicator.stopAnimating()
        }
    }

    func showNetworkError(){
        //Show Error message
        self.showAlertFailed(title: "Error", message: "Something went wrong, check your internet connection and try again.", controller: self)
        self.indicator.stopAnimating()
    }

    //  Initialization of Loading HUD
    func initLoadingIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.center = self.view.center
        indicator.backgroundColor = UIColor.darkGray.withAlphaComponent(0.6)
        indicator.color = UIColor.white
        indicator.layer.cornerRadius = 10
        self.view.addSubview(indicator)
    }

}
//CollectionView delegate setup
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return 30.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //calculate cell size for collection view cell
        var cellSize: CGSize = collectionView.bounds.size
        cellSize.width -= collectionView.contentInset.left * 1.2
        cellSize.width -= collectionView.contentInset.right * 1.2
        return cellSize
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return cell number depending on data recived
        return eventsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        let rowValue = indexPath.row
        if eventsArray.count > rowValue {
            // fill up cell data for index
            cell.cellIndex = rowValue
            cell.configureCell(objectData: eventsArray[rowValue])
        }
        return cell
    }

    //open Details VC if user taps cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        userDetailVC.modalPresentationStyle = .fullScreen
        userDetailVC.eventData = eventsArray[indexPath.row]
        //Transition Animation and presentation
        let transition = CATransition().customTransition(fromLeft: false)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(userDetailVC, animated: false)
    }

}
