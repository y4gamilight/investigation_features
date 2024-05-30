//
//  ReliaNativeAdsVC.swift
//  IntegrateFeatures
//
//  Created by Lê Thành on 30/05/2024.
//

import UIKit

class ReliaNativeAdsVC: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    private var viewModel: ReliaNativeAdViewModel = ReliaNativeAdViewModel()
    private var dataSource: ReliaNativeAdDataSource = ReliaNativeAdDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setup() {
        let nib = UINib(nibName: ReliaNativeTableCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ReliaNativeTableCell.identifier)
        let collectionNib = UINib(nibName: ReliaNativeCollectionCell.nibName, bundle: nil)
        collectionView.register(collectionNib, forCellWithReuseIdentifier: ReliaNativeCollectionCell.identifier)
    }
    
    override func bindData() {
        viewModel.onLoadTableCell = {[weak self] items in
            self?.dataSource.updateCellItems(items)
            self?.tableView.reloadData()
            
        }
        viewModel.onLoadCollectionCell = {[weak self] items in
            self?.dataSource.updateCollectionItems(items)
            self?.collectionView.reloadData()
        }
    }
    
    override func configuration() {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        
        viewModel.loadData()
    }
}
