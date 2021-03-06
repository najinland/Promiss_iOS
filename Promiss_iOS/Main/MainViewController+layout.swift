//
//  MainViewController+layout.swift
//  Promiss_iOS
//
//  Created by 임수현 on 18/09/2019.
//  Copyright © 2019 Anna Lee. All rights reserved.
//

import UIKit

extension MainViewController {
    func setupTitleView() {
        let colorTop = UIColor.white.cgColor
        let colorBottom = UIColor(white: 1, alpha: 0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.titleView.bounds
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        
        self.titleView.layer.insertSublayer(gradientLayer, at: 0)
        
        self.memberCollectionView.delegate = self
        self.memberCollectionView.dataSource = self
    }
    
    func setupMainInfo() {
        switch appointmentStatus{
        case .Progress:
            appointmentNameLabel.text = AppointmentInfo.shared.name
            createOrDetailButton.isHidden = true
            break
            
        case .Wait:
            appointmentNameLabel.text = AppointmentInfo.shared.name
            createOrDetailButton.isHidden = false
            createOrDetailButton.setTitle("상세보기", for: .normal)
            
            // pusher 연결 해제
            disconnectPusher()
            
        case .Done:
            appointmentNameLabel.text = "현재 약속이 없습니다."
            leftTimeLabel.text = ""
            createOrDetailButton.isHidden = false
            createOrDetailButton.setTitle("약속 만들기", for: .normal)
            
            // pusher 연결 해제
            disconnectPusher()
            return
        }
    }
    
    func setupInviteView() {
        inviteMessageView.layer.cornerRadius = 20
        inviteMessageView.alpha = 0
    }
    
    func setupFineLabel() {
        fineLabel.isHidden = false
        guard let members = PusherInfo.shared.members else {
            fineLabel.text = "현재 벌금: 0원"
            return
        }
        
        var fine: Int?
        for mem in members{
            if UserInfo.shared.id == mem.id {
                fine = mem.fineCurrent
                break
            }
        }
        fineLabel.text = "현재 벌금: \(fine ?? 0)원"
    }
}
