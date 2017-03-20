//
//  ViewModel.swift
//  MVVMSample
//
//  Created by Allen Hsu on 2017/3/20.
//  Copyright © 2017年 Allen Hsu. All rights reserved.
//

import Foundation
import UIKit

protocol ViewModel {
	
}

protocol BindableView {
	associatedtype ViewModelType
	var viewModel: ViewModelType! { get }
	func bindViewModel(viewModel: ViewModelType)
}


protocol BindableTableCell: BindableView {
	
}

protocol CellConfiguratorType {
	var reuseIdentifier: String { get }
	var cellClass: AnyClass { get }
}

struct BindableCellConfigurator<Cell> where Cell: UITableViewCell, Cell: BindableTableCell {
	let reuseIdentifier: String = NSStringFromClass(Cell.self)
	let cellClass: AnyClass = Cell.self
}


extension BindableCellConfigurator: CellConfiguratorType {
}

