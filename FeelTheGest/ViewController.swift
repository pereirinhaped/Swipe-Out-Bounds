//
//  ViewController.swift
//  FeelTheGest
//
//  Created by Pedro Pereirinha on 08/08/16.
//  Copyright © 2016 EpicDory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var mainScrollView: UIScrollView!
	
	let bkgColors = [UIColor.yellow.withAlphaComponent(0.3), UIColor.blue.withAlphaComponent(0.3), UIColor.red.withAlphaComponent(0.3)]
	
	var MAX_PAGE: Int {
		return bkgColors.count - 1
	}
	let MIN_PAGE = 0
	var CUR_PAGE = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Set some ScrollView properties
		mainScrollView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)

	}
	
	override func viewDidAppear(_ animated: Bool) {
		
		for x in 0...2 {
			
			let scrollViewWidth = mainScrollView.frame.width
			let scrollViewHeight = mainScrollView.frame.height
			
			let newX = scrollViewWidth * (1/2.0 + CGFloat(x))
			
			let subView = UIView(frame: CGRect(x: newX - 50, y: (scrollViewHeight / 2) - 50, width: 100, height: 100))
			subView.backgroundColor = bkgColors[x]
			
			mainScrollView.addSubview(subView)
		}
		
		let contentWidth = mainScrollView.frame.width * CGFloat(bkgColors.count)
		let contentHeight = mainScrollView.frame.height
		mainScrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
	}

	@IBAction func detectSwipe(_ sender: UISwipeGestureRecognizer) {
		
		if CUR_PAGE < MAX_PAGE && sender.direction == .left {
			moveScrollView(direction: 1)
		}
		
		if CUR_PAGE > MIN_PAGE && sender.direction == .right {
			moveScrollView(direction: -1)
		}
	}
	
	func moveScrollView(direction: Int){
		CUR_PAGE = CUR_PAGE + direction
		let point = CGPoint(x: mainScrollView.frame.width * CGFloat(CUR_PAGE), y: 0.0)
		mainScrollView.setContentOffset(point, animated: true)
	}
	
}

