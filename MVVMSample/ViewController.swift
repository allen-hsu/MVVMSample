//
//  ViewController.swift
//  MVVMSample
//
//  Created by Allen Hsu on 2017/3/20.
//  Copyright © 2017年 Allen Hsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var tableView: UITableView?
	var viewModel: SettingViewModel?
	var items: [CellConfiguratorType] = [BindableCellConfigurator<TextFieldCell>(), BindableCellConfigurator<ButtonCell>()]
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = SettingViewModel()
		tableView = UITableView(frame: view.bounds)
		tableView!.tableFooterView = UIView()
		tableView!.rowHeight = 100
		tableView!.dataSource = self
		
		view.addSubview(tableView!)
		registerCells()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func registerCells() {
		for cellConfigurator in items {
			tableView!.register(cellConfigurator.cellClass, forCellReuseIdentifier: cellConfigurator.reuseIdentifier)
		}
	}
}

extension ViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellConfigurator = items[(indexPath as NSIndexPath).row]
		let cell = tableView.dequeueReusableCell(withIdentifier: cellConfigurator.reuseIdentifier, for: indexPath)
		cellConfigurator.bindViewModel(cell: cell, viewModel: self.viewModel! as! ViewModel)
		return cell
	}

}
