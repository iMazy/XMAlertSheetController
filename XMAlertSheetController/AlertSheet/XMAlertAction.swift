//
//  XMAlertAction.swift
//  XMAlertSheetController
//
//  Created by Mazy on 2019/5/31.
//  Copyright © 2019 Mazy. All rights reserved.
//

import UIKit

@objc public enum XMAlertActionStyle: Int {
    
    case `default`
    case cancel
    case destructive
}

@objc open  class XMAlertAction: UIButton {

    private var action: (() -> Void)?
    
    open var actionStyle: XMAlertActionStyle = .cancel
    /// 分割线
    open var partingLine = UIView()
    
    init() {
        super.init(frame: .zero)
    }
    
     @objc public convenience init(title: String, style: XMAlertActionStyle, action: (() -> Void)? = nil) {
        self.init()
        self.action = action
        self.actionStyle = style

        self.addTarget(self, action: #selector(tappedAction), for: .touchUpInside)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        switch style {
        case .default:
            self.setTitleColor(UIColor.black, for: .normal)
        case .destructive:
            self.setTitleColor(UIColor.red, for: .normal)
        case .cancel:
            self.setTitleColor(UIColor.darkGray, for: .normal)
        }
        self.addSeparatorLine(style: style)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension XMAlertAction {
    
    @objc func tappedAction() {
        //Action need to be fired after alert dismiss
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.action?()
        }
    }
    
    func addSeparatorLine(style: XMAlertActionStyle) {
        
        partingLine.backgroundColor = #colorLiteral(red: 0.9395350814, green: 0.9491689801, blue: 0.9619832635, alpha: 1)
        self.addSubview(partingLine)
        
        // Autolayout separator
        partingLine.translatesAutoresizingMaskIntoConstraints = false
        partingLine.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        partingLine.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -15).isActive = true
        partingLine.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: 15).isActive = true
        let height: CGFloat = style == .cancel ? 8 : 0.5
        partingLine.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
