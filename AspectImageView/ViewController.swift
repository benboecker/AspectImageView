//
//  ViewController.swift
//  AspectImageView
//
//  Created by Benni on 21.08.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var imageView: AspectImageView!

	override func viewDidLoad() {
		super.viewDidLoad()

		self.imageView.image = UIImage(named: "kitten")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func scaleToFill(sender: AnyObject) {
		self.animateTo(.ScaleToFill)
	}

	@IBAction func topLeft(sender: AnyObject) {
		self.animateTo(.TopLeft)
	}

	@IBAction func top(sender: AnyObject) {
		self.animateTo(.Top)
	}

	@IBAction func topRight(sender: AnyObject) {
		self.animateTo(.TopRight)
	}

	@IBAction func aspectFit(sender: AnyObject) {
		self.animateTo(.ScaleAspectFit)
	}

	@IBAction func left(sender: AnyObject) {
		self.animateTo(.Left)
	}

	@IBAction func center(sender: AnyObject) {
		self.animateTo(.Center)
	}

	@IBAction func right(sender: AnyObject) {
		self.animateTo(.Right)
	}

	@IBAction func aspectFill(sender: AnyObject) {
		self.animateTo(.ScaleAspectFill)
	}

	@IBAction func bottomLeft(sender: AnyObject) {
		self.animateTo(.BottomLeft)
	}

	@IBAction func bottom(sender: AnyObject) {
		self.animateTo(.Bottom)
	}

	@IBAction func bottomRight(sender: AnyObject) {
		self.animateTo(.BottomRight)
	}

	func animateTo(contentMode: UIViewContentMode) {
		UIView.animateWithDuration(1.0) { 
			self.imageView.contentMode = contentMode
		}
//		UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [.CurveEaseInOut], animations: {
//			self.imageView.contentMode = contentMode
//		}) { (finished) in
//			
//		}
	}
}

