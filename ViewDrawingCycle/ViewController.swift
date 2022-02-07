//
//  ViewController.swift
//  ViewDrawingCycle
//
//  Created by JeongTaek Han on 2022/02/07.
//

import UIKit


class CustomeView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let myFrame = self.bounds
        
        context.setLineWidth(10)
        
        let color: [UIColor] = [.red, .blue, .brown, .cyan, .green]
        
        color.randomElement()?.set()
        UIRectFrame(myFrame.insetBy(dx: 5, dy: 5))
    }
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        print(#function)
    }
    
//    override func setNeedsLayout() {
//        super.setNeedsLayout()
//        print(#function)
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        print(#function)
//    }
//
//    override func updateConstraints() {
//        super.updateConstraints()
//        print(#function)
//    }
//
//    override func setNeedsUpdateConstraints() {
//        super.setNeedsUpdateConstraints()
//        print(#function)
//    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var view2: CustomeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
    
//        self.view2.setNeedsDisplay()
        self.view2.setNeedsDisplay(CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
    }
    
    
    @IBAction func hiddenButtonCLicked(_ sender: UIButton) {
        self.view2.isHidden.toggle()
    }
    
}

