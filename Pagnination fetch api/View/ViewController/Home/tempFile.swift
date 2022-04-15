////
////  HomeVM.swift
////  Pagnination fetch api
////
////  Created by Shivaditya Kumar on 16/02/22.
////
//
//import Foundation
//import UIKit
////import PaginatedTableView
//
//class HomeVM : NSObject, PaginatedTableViewDelegate, PaginatedTableViewDataSource {
//    
//    var view : HomeView? {
//        didSet{
//            self.view?.tableView.paginatedDelegate = self
//            self.view?.tableView.paginatedDataSource = self
//            self.view?.tableView.loadData(refresh: true)
//            view?.tableView.refreshControl?.addTarget(self, action: #selector(didRefreshTableVeiw), for: .valueChanged)
//            view?.tableView.register(UINib(nibName: "CustomTVC", bundle: nil), forCellReuseIdentifier: "CustomTVC")
//
//        }
//    }
//    @objc func didRefreshTableVeiw() {
//        
//        view?.tableView.reloadData()
//        view?.tableView.refreshControl?.endRefreshing()
//    }
////    private var imagelistLimit = 100
//    private var imageList : [ImageListResponseElement] = []
//    
//    func loadMore(_ pageNumber: Int, _ pageSize: Int, onSuccess: ((Bool) -> Void)?, onError: ((Error) -> Void)?) {
//        if pageNumber < pageSize - 1 {
//            PhotoRestManager.shared.getImageList(page: pageNumber, limit: pageSize) { result in
//                switch result {
//                case .success(let response):
//                    self.imageList.append(contentsOf: response)
//                    self.view?.tableView.refreshControl?.endRefreshing()
//                    self.view?.tableView.reloadData()
//                    print(response)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//            }
//            else {
//                onSuccess?(false)
//            }
//          
//            if pageNumber == 0 {
//                
//                }
//
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 5
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return imageList.count
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
//    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == imageList.count-1 {
//            moreData()
//        }
//    }
//    
//    func moreData() {
//        for i in 0...5 {
//            PhotoRestManager.shared.getImageList(page: i, limit: 5) { result in
//                switch result {
//                case .success(let response):
//                    self.imageList.append(contentsOf: response)
//                    self.view?.tableView.reloadData()
//                    print(response)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//        }
//        self.view?.tableView.reloadData()
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTVC") as? CustomTVC else {
//            return UITableViewCell()
//        }
//        cell.setData(data: self.imageList[indexPath.row])
//        return cell
//    }
//    
//
//    
//
//    
//    
//    
//   
//
//    
//    
//    
////    func getImageList(page : Int) {
////        PhotoRestManager.shared.getImageList(page: page, limit: imagelistLimit) { result in
////            switch result {
////            case .success(let response):
////                self.imageList.append(contentsOf: response)
////                self.view?.tableView.reloadData()
////                print(response)
////            case .failure(let error):
////                print(error)
////            }
////        }
////    }
////    var titleArray : [String] = ["Vidhi", "Shiva", "Himanshu", "Sandeep", "Aaditya", "Macbook", "Air", "IPhone"]
//    
//    
//    
//    
//}
//
//
//
////extension HomeVM: UITableViewDelegate, UITableViewDataSource {
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return self.imageList.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTVC") as? CustomTVC else {
////            return UITableViewCell()
////        }
////        cell.setData(data: self.imageList[indexPath.row])
////        return cell
////    }
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        print("row: \(indexPath.row), section: \(indexPath.section)")
////    }
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        return 200
////    }
////}
