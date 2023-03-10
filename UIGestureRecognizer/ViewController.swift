//
//  ViewController.swift
//  UIGestureRecognizer
//
//  Created by Vladyslav Petrenko on 19/02/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gestureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeObservers()
        tapObserver()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View did appear")
    }
    
    func swipeObservers() { // создаем наблюдателя для свайпа в разные стороны
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(gesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(gesture:)))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(gesture:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func tapObserver() {
        
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tapAction(gesture:)))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(tapAction(gesture:)))
        doubleTap.require(toFail: tripleTap) // Указывает, что нам нужно игнорировать двойной тап, если бы тапаем трижды
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func handleSwipes(gesture: UISwipeGestureRecognizer) {
        
        switch gesture.direction {
        case .right:
            gestureLabel.text = "Right swipe has been recognized!"
        case .left:
            gestureLabel.text = "Left swipe has been recognized!"
        case .up:
            gestureLabel.text = "Up swipe has been recognized!"
        case .down:
            gestureLabel.text = "Down swipe has been recognized!"
        default: return
        }
    }
    
    @objc func tapAction(gesture: UITapGestureRecognizer) {
        
        switch gesture.numberOfTapsRequired {
        case 2:
            gestureLabel.text = "Double tap has been recognized"
        case 3:
            gestureLabel.text = "Triple tap has been recognized"
        default: return
        }
    }
    
    @objc func doubleTapAction(gesture: UITapGestureRecognizer) {
        
        
    }
}

