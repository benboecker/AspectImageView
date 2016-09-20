//
//  AspectImageView.swift
//  AspectImageView
//
//  Created by Benni on 21.08.16.
//  Copyright © 2016 Ben Boecker. All rights reserved.
//

import UIKit

class AspectImageView: UIView {

	/// Private UIImageView to display the image
	private var imageView: UIImageView = UIImageView()

	/// Overriding the contentMode property to update the imageView when the contentMode changes
	override var contentMode: UIViewContentMode {
		didSet {
			self.imageView.contentMode = contentMode
			super.contentMode = contentMode
			self.updateView()
		}
	}

	/// Passing the image through to the imageView to update the imageView everytime the image changes
	var image: UIImage? {
		set {
			self.imageView.image = newValue
			self.updateView()
		}
		get {
			return self.imageView.image
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.commonInit()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		self.commonInit()
	}

	init(image: UIImage) {
		super.init(frame: CGRect.zero)

		self.commonInit()
	}

	private func commonInit() {
		self.clipsToBounds = true
		self.contentMode = .ScaleAspectFill
		self.translatesAutoresizingMaskIntoConstraints = false

		self.imageView = UIImageView(frame: CGRect.zero)
		self.imageView.contentMode = self.contentMode
		self.addSubview(self.imageView)
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		self.updateView()
	}

	private func updateView() {
		switch self.contentMode {
		case .ScaleAspectFit:
			self.aspectFit()
		case .ScaleAspectFill:
			self.aspectFill()
		case .Center:
			self.center()
		case .ScaleToFill:
			self.scaleToFill()
		case .Top:
			self.top()
		case .Bottom:
			self.bottom()
		case .Left:
			self.left()
		case .Right:
			self.right()
		case .TopLeft:
			self.topLeft()
		case .TopRight:
			self.topRight()
		case .BottomLeft:
			self.bottomLeft()
		case .BottomRight:
			self.bottomRight()
		default:
			break
		}
	}

	private func aspectFit() {
		guard let image = self.imageView.image else {
			return
		}

		var imageSize = CGSize(width: image.size.width / image.scale, height: image.size.height / image.scale)
		let widthRatio = imageSize.width / self.bounds.size.width
		let heightRatio = imageSize.height / self.bounds.size.height

		if widthRatio > heightRatio {
			imageSize = CGSize(width: imageSize.width / widthRatio, height: imageSize.height / widthRatio)
		} else {
			imageSize = CGSize(width: imageSize.width / heightRatio, height: imageSize.height / heightRatio)
		}

		self.imageView.bounds = CGRect(origin: CGPoint.zero, size: imageSize)
		self.centerImageViewToSuperView()
	}

	private func aspectFill() {
		guard let image = self.imageView.image else {
			return
		}

		var imageSize = CGSize(width: image.size.width / image.scale, height: image.size.height / image.scale)
		let widthRatio = imageSize.width / self.bounds.size.width
		let heightRatio = imageSize.height / self.bounds.size.height

		if widthRatio > heightRatio {
			imageSize = CGSize(width: imageSize.width / heightRatio, height: imageSize.height / heightRatio)
		} else {
			imageSize = CGSize(width: imageSize.width / widthRatio, height: imageSize.height / widthRatio)
		}

		self.imageView.bounds = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
		self.centerImageViewToSuperView()
	}

	private func center() {
		self.fitImageViewSizeToImageSize()
		self.centerImageViewToSuperView()
	}

	private func scaleToFill() {
		self.imageView.frame = self.bounds
	}

	private func top() {
		guard let image = self.image else {
			return
		}

		self.fitImageViewSizeToImageSize()
		self.imageView.center = CGPoint(x: self.bounds.size.width / 2, y: image.size.height / 2);
	}

	private func bottom() {
		guard let image = self.image else {
			return
		}

		self.fitImageViewSizeToImageSize()
		self.imageView.center = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height - image.size.height / 2);
	}

	private func left() {
		guard let image = self.image else {
			return
		}

		self.fitImageViewSizeToImageSize()
		self.imageView.center = CGPoint(x: image.size.width / 2, y: self.bounds.size.height / 2);
	}

	private func right() {
		guard let image = self.image else {
			return
		}

		self.fitImageViewSizeToImageSize()
		self.imageView.center = CGPoint(x: self.bounds.size.width - image.size.width / 2, y: self.bounds.size.height / 2)
	}

	private func topLeft() {
		guard let image = self.image else {
			return
		}

		self.fitImageViewSizeToImageSize()
		self.imageView.center = CGPoint(x: image.size.width / 2, y: image.size.height / 2);
	}

	private func topRight() {
		guard let image = self.image else {
			return
		}

		self.fitImageViewSizeToImageSize()
		self.imageView.center = CGPoint(x: self.bounds.size.width - image.size.width / 2, y: image.size.height / 2);
	}

	private func bottomLeft() {
		guard let image = self.image else {
			return
		}

		self.fitImageViewSizeToImageSize()
		self.imageView.center = CGPoint(x: image.size.width / 2, y: self.bounds.size.height - image.size.height / 2);

	}

	private func bottomRight() {
		guard let image = self.image else {
			return
		}

		self.fitImageViewSizeToImageSize()
		self.imageView.center = CGPoint(x: self.bounds.size.width - image.size.width / 2, y: self.bounds.size.height - image.size.height / 2);
	}

	private func fitImageViewSizeToImageSize() {
		guard let image = self.image else {
			return
		}

		let imageSize = CGSize(width: image.size.width / image.scale, height: image.size.height / image.scale);
		self.imageView.bounds = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height);
	}

	private func centerImageViewToSuperView() {
		let x = self.bounds.size.width / 2
		let y = self.bounds.size.height / 2
		self.imageView.center = CGPoint(x: x, y: y)
		
	}
}



