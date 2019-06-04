//
//  XMAlertSheetViewController.swift
//  XMAlertSheetController
//
//  Created by Mazy on 2019/5/31.
//  Copyright © 2019 Mazy. All rights reserved.
//

import UIKit

class XMAlertSheetViewController: UIViewController {

    /// 主标题
    @IBOutlet weak var alertTitle: UILabel!
    /// 副标题
    @IBOutlet weak var alertMessage: UILabel!
    /// 弹框主视图
    @IBOutlet weak var alertView: UIView!
    /// action stack view
    @IBOutlet weak var alertActionStackView: UIStackView!
    
    @IBOutlet weak var alertActionStackViewHeightConstraint: NSLayoutConstraint!
    
//    @IBOutlet weak var alertTitleHeightConstraint: NSLayoutConstraint!
    
    open var ALERT_STACK_VIEW_HEIGHT : CGFloat = 50
    private var contentViewHeight: CGFloat = 0
    
    open var dismissWithBackgroudTouch = false // enable touch background to dismiss. Off by
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.alertView.transform = CGAffineTransform(translationX: 0, y: self.contentViewHeight)
        UIView.animate(withDuration: 0.25) {
            self.alertView.transform = CGAffineTransform.identity
        }
    }

    convenience init(title: String? = nil, message: String? = nil) {
        self.init()
        
        guard let nib = loadNibAlertController(), let unwrappedView = nib[0] as? UIView else { return }
        self.view = unwrappedView
        /// for present vc
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        if let title = title, title.count > 0 {
            alertTitle.isHidden = false
            alertTitle.text = title
        } else {
            alertTitle.isHidden = true
//            alertTitleHeightConstraint.constant = 0
        }
        
        if let message = message, message.count > 0 {
            alertMessage.isHidden = false
            alertMessage.text = message
        } else {
            alertMessage.text = ""
            alertMessage.isHidden = true
//            alertTitleHeightConstraint.constant = 0
        }
        
        //Gesture recognizer for background dismiss with background touch
        let tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(dismissAlertControllerFromBackgroundTap))
        self.view.addGestureRecognizer(tapRecognizer)
        
        setShadowAlertView()
    }
    
    //MARK: - Actions
    @objc open func addAction(_ alertAction: XMAlertAction) {
        
        alertActionStackView.addArrangedSubview(alertAction)
        
        if alertActionStackView.arrangedSubviews.count >= 2 {
            alertActionStackViewHeightConstraint.constant = ALERT_STACK_VIEW_HEIGHT * CGFloat(alertActionStackView.arrangedSubviews.count)
            alertActionStackView.axis = .vertical
        } else {
            alertActionStackViewHeightConstraint.constant = ALERT_STACK_VIEW_HEIGHT
            alertActionStackView.axis = .vertical
        }
        
        alertAction.addTarget(self, action: #selector(XMAlertSheetViewController.dismissAlertController(_:)), for: .touchUpInside)
        
        contentViewHeight = ALERT_STACK_VIEW_HEIGHT * CGFloat(alertActionStackView.arrangedSubviews.count)
    }
    
    @objc fileprivate func dismissAlertController(_ sender: XMAlertAction){
        animateDismiss()
    }
    
    @objc fileprivate func dismissAlertControllerFromBackgroundTap() {
        if !dismissWithBackgroudTouch {
            return
        }
        animateDismiss()
    }
    
    //MARK: - Customizations
    @objc fileprivate func setShadowAlertView(){
        alertView.layer.masksToBounds = false
        alertView.layer.shadowOffset = CGSize(width: 0, height: 0)
        alertView.layer.shadowRadius = 3
        alertView.layer.shadowOpacity = 0.3
    }
    
    @objc fileprivate func loadNibAlertController() -> [AnyObject]? {
        let podBundle = Bundle(for: self.classForCoder)
        
        if let bundleURL = podBundle.url(forResource: "XMAlertSheetViewController", withExtension: "bundle"){
            
            if let bundle = Bundle(url: bundleURL) {
                return bundle.loadNibNamed("XMAlertSheetViewController", owner: self, options: nil) as [AnyObject]?
            } else {
                assertionFailure("Could not load the bundle")
            }
        } else if let nib = podBundle.loadNibNamed("XMAlertSheetViewController", owner: self, options: nil) as [AnyObject]?{
            return nib
        } else {
            assertionFailure("Could not create a path to the bundle")
        }
        return nil
    }
    
    private func animateDismiss() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alertView.transform = CGAffineTransform(translationX: 0, y: self.alertView.bounds.height)
            
        }, completion: { _ in
            self.dismiss(animated: true, completion: nil)
        })
    }
}
