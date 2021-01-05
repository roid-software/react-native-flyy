package com.reactnativeflyy;

import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import theflyy.com.flyy.Flyy;

public class FlyyRouteActivity extends AppCompatActivity {

  public static String PAGE_TO_OPEN = "page_to_open";
  public static final String FLYY_OFFERS_PAGE = "flyy_offers_page";
  public static final String FLYY_REWARDS_PAGE = "flyy_rewards_page";
  public static final String FLYY_WALLET_PAGE = "flyy_wallet_page";
  public static final String FLYY_GIFT_CARDS_PAGE = "flyy_gift_cards_page";
  public static final String FLYY_REFERRAL_HISTORY_PAGE = "flyy_referral_history_page";

  @Override
  protected void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    String activityToOpen = getIntent().getStringExtra(PAGE_TO_OPEN);

    if (activityToOpen != null)
      switch (activityToOpen) {
        case FLYY_OFFERS_PAGE:
          Flyy.navigateToOffersActivity(this);
          break;
        case FLYY_REWARDS_PAGE:
          Flyy.navigateToRewardsActivity(this);
          break;
        case FLYY_WALLET_PAGE:
          Flyy.navigateToWalletActivity(this);
          break;
        case FLYY_GIFT_CARDS_PAGE:
          Flyy.navigateToGiftCardsActivity(this);
          break;
        case FLYY_REFERRAL_HISTORY_PAGE:
          Flyy.navigateToReferralHistoryActivity(this);
          break;
        default:
          throw new IllegalStateException("Unexpected value: " + activityToOpen);
      }
    finish();
  }


}
