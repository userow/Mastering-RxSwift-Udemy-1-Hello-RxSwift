//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by Pavlo Vasylenko on 06.06.2023.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		_ = Observable.from([1,2,3,4,5,6])
	}


}

