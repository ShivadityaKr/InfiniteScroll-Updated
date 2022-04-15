//
//  HomeVM.swift
//  Pagnination fetch api
//
//  Created by Shivaditya Kumar on 16/02/22.
//

import Foundation
import UIKit
import PagingTableView

class HomeVM : NSObject {
    private var imageList : [ImageListResponseElement] = []
    var view : HomeView? {
        didSet{
            view?.tableView.reloadData()
            self.view?.tableView.pagingDelegate = self
            self.view?.tableView.estimatedRowHeight = 200
            self.view?.tableView.rowHeight = UITableView.automaticDimension
            self.view?.tableView.dataSource = self
            //            view?.tableView.refreshControl?.addTarget(self, action: #selector(didRefreshTableVeiw), for: .valueChanged)
            view?.tableView.register(UINib(nibName: "CustomTVC", bundle: nil), forCellReuseIdentifier: "CustomTVC")
            
        }
    }
    //    @objc func didRefreshTableVeiw() {
    //        view?.tableView.reloadData()
    //        view?.tableView.refreshControl?.endRefreshing()
    //    }
    
    var imagelistLimit = 10
    func getImageList(page : Int) {
        self.view?.tableView.isLoading = true
        PhotoRestManager.shared.getImageList(page: page, limit: imagelistLimit) { result in
            switch result {
            case .success(let response):
                let prevCount = self.imageList.count
                self.imageList.append(contentsOf: response)
                self.view?.tableView.beginUpdates()
                let startIndex = prevCount
                let endIndex = self.imageList.count - 1
                var indexPaths = [IndexPath]()
                for i in startIndex...endIndex {
                    indexPaths.append(IndexPath(row: i, section: 0))
                }
                self.view?.tableView.isLoading = false
                self.view?.tableView.insertRows(at: indexPaths, with: .automatic)
                self.view?.tableView.endUpdates()
            case .failure(let error):
                print(error)
            }
        }
    }
}
extension HomeVM : PagingTableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTVC", for: indexPath) as? CustomTVC else { return UITableViewCell() }
        guard imageList.indices.contains(indexPath.row) else { return cell }
        cell.setData(data: self.imageList[indexPath.row])
        return cell
    }
    func paginate(_ tableView: PagingTableView, to page: Int) {
        self.getImageList(page: page)
    }
}
