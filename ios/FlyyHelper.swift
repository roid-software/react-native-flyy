//
//  Flyy.swift
//  react-native-flyy
//
//  Created by Pooja Deshpande on 06/01/21.
//

import Foundation
import UIKit

@objc
public class FlyyHelper: NSObject {
    
    public static var PAGE_TO_OPEN = URL(string: "")
    public static var LABEL_TEXT = "Loading Offers..."
    
    private let FLYY_OPEN_OFFERS_SCREEN = "offers_page"
    private let FLYY_OPEN_REWARDS_SCREEN = "rewards_page"
    private let FLYY_OPEN_WALLET_SCREEN = "wallet_page"
    private let FLYY_OPEN_GIFT_CARDS_SCREEN = "gift_cards_page"
    private let FLYY_OPEN_REFERRAL_SCREEN = "referral_history_page"
    
    var uiViewController : UIViewController
    
    override init() {
        let viewController: UIViewController =
            (UIApplication.shared.delegate?.window??.rootViewController)!
        self.uiViewController = viewController
    }
    
    @objc func openPages(pageName: String) -> Void {
        switch pageName {
        case FLYY_OPEN_OFFERS_SCREEN:
            WebViewController.PAGE_TO_OPEN = URL(string: "https://web-sdk.theflyy.com/")
            WebViewController.LABEL_TEXT = "Loading Offers..."
            break
        case FLYY_OPEN_REWARDS_SCREEN:
            WebViewController.PAGE_TO_OPEN = URL(string: "https://web-sdk.theflyy.com/rewards")
            WebViewController.LABEL_TEXT = "Loading Rewards..."
            break
        case FLYY_OPEN_WALLET_SCREEN:
            WebViewController.PAGE_TO_OPEN = URL(string: "https://web-sdk.theflyy.com/wallet")
            WebViewController.LABEL_TEXT = "Loading Wallet..."
            break
        case FLYY_OPEN_GIFT_CARDS_SCREEN:
            WebViewController.PAGE_TO_OPEN = URL(string: "https://web-sdk.theflyy.com/gift-cards")
            WebViewController.LABEL_TEXT = "Loading Gift Cards..."
            break
        case FLYY_OPEN_REFERRAL_SCREEN:
            WebViewController.PAGE_TO_OPEN = URL(string: "https://web-sdk.theflyy.com/referrals")
            WebViewController.LABEL_TEXT = "Loading Referrals..."
            break
        default:
            WebViewController.PAGE_TO_OPEN = URL(string: "https://web-sdk.theflyy.com/")
            WebViewController.LABEL_TEXT = "Loading Offers..."
        }
        
        let webViewController = WebViewController.init()
        let navigationController = UINavigationController(rootViewController: (webViewController))
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setNavigationBarHidden(true, animated: true)
        self.uiViewController.present(navigationController, animated: true)
    }
}
