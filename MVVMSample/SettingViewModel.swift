//
//  SettingViewModel.swift
//  MVVMSample
//
//  Created by Allen Hsu on 2017/3/20.
//  Copyright © 2017年 Allen Hsu. All rights reserved.
//

import Foundation
import Bond
//protocol TextFieldViewData: CellViewData {
//	var textFieldValue: Observable<String?> { get }
//}
//
//protocol Buttonable {
//	func touchEvent(event: UIControlEvents)
//}
//
//protocol ButtonViewData: CellViewData {
//	var isVaild: Observable<Bool?> { get }
//}

struct SettingViewModel: TextFieldViewData, Buttonable, ButtonViewData, ViewModel {
	var isVaild: Observable<Bool?> = Observable(false)
	var textFieldValue: Observable<String?> = Observable("")
	func touchEvent(event: UIControlEvents){
		
	}
}
