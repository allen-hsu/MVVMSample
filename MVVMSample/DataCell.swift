//
//  DataCell.swift
//  MVVMSample
//
//  Created by Allen Hsu on 2017/3/20.
//  Copyright © 2017年 Allen Hsu. All rights reserved.
//

import Foundation

import UIKit
import Bond
import SnapKit

protocol CellViewData {
	
}

protocol TextFieldViewData: CellViewData {
	var textFieldValue: Observable<String?> { get }
}

protocol Buttonable {
	func touchEvent(event: UIControlEvents)
}

protocol ButtonViewData: CellViewData {
	var isVaild: Observable<Bool?> { get }
}

class TextFieldCell: UITableViewCell, BindableTableCell {
	
	let textField: UITextField = UITextField()
	
	typealias ViewModelType = TextFieldViewData & ViewModel

	var viewModel: ViewModelType!
	func bindViewModel( viewModel: ViewModelType) {
		textField.reactive.text.bind(to: viewModel.textFieldValue)
		//viewModel.textFieldValue.
	}
	
	// MARK:- init
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.addSubview(textField)
		textField.placeholder = "TestPlaceholder"
		textField.snp.makeConstraints { (make) in
			make.bottom.top.left.right.equalToSuperview()
		}
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


class ButtonCell: UITableViewCell, BindableTableCell {
	let button: UIButton = UIButton()
	typealias ViewModelType = ButtonViewData & ViewModel & Buttonable
	var viewModel: ViewModelType!
	func bindViewModel( viewModel: ViewModelType) {
		button.reactive.controlEvents(.touchUpInside).observeNext {
			viewModel.touchEvent(event: .touchUpInside)
		}
	}
	
	// MARK:- init
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.addSubview(button)
		button.setTitle("TestBtn", for: .normal)
		button.setTitleColor(UIColor.black, for: .normal)
		button.snp.makeConstraints { (make) in
			make.bottom.top.left.right.equalToSuperview()
		}
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

