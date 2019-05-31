//
//  XMAlertAction.swift
//  XMAlertSheetController
//
//  Created by Mazy on 2019/5/31.
//  Copyright © 2019 Mazy. All rights reserved.
//

import UIKit

enum XMAlertActionStyle: Int {
    
    case `default`
    case cancel
    case destructive
}

open class XMAlertAction: UIButton {

    open var action: (() -> Void)?
    
    var actionStyle: XMAlertActionStyle = .cancel
    
    lazy var separator = UIView()
    
    init() {
        super.init(frame: .zero)
    }
    
    convenience init(title: String, style: XMAlertActionStyle, action: (() -> Void)? = nil) {
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
        default:
            break
        }
        self.addSeparatorLine()
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
    
    func addSeparatorLine() {
        separator.backgroundColor = UIColor.lightGray
        self.addSubview(separator)
        
        // Autolayout separator
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        separator.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: -15).isActive = true
        separator.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: 15).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
}
