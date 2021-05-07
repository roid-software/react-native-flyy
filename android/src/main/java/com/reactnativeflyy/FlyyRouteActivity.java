package com.reactnativeflyy;

import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import theflyy.com.flyy.Flyy;

public class FlyyRouteActivity extends AppCompatActivity {

  public static String PAGE_TO_OPEN = "page_to_open";
  public static String SEGMENT_ID = "segment_id";
  public static int QUIZ_ID = 0;
  public static int OFFER_ID = 0;
  public static final String FLYY_OFFERS_PAGE = "flyy_offers_page";
  public static final String FLYY_REWARDS_PAGE = "flyy_rewards_page";
  public static final String FLYY_WALLET_PAGE = "flyy_wallet_page";
  public static final String FLYY_GIFT_CARDS_PAGE = "flyy_gift_cards_page";
  public static final String FLYY_REFERRAL_HISTORY_PAGE = "flyy_referral_history_page";
  public static final String FLYY_QUIZ_PAGE = "flyy_quiz_page";
  public static final String FLYY_QUIZ_HISTORY_PAGE = "flyy_quiz_history_page";
  public static final String FLYY_QUIZ_LIST_PAGE = "flyy_quiz_list_page";
  public static final String FLYY_STAMPS_PAGE = "flyy_stamps_page";
  public static final String FLYY_INVITE_DETAILS_PAGE = "flyy_invite_details_page";

  @Override
  protected void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    String activityToOpen = getIntent().getStringExtra(PAGE_TO_OPEN);

    if (activityToOpen != null)
      switch (activityToOpen) {
        case FLYY_OFFERS_PAGE:
          if (getIntent().getStringExtra(SEGMENT_ID) != null) {
            Flyy.navigateToOffersActivity(this, getIntent().getStringExtra(SEGMENT_ID));
          } else {
            Flyy.navigateToOffersActivity(this);
          }
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
        case FLYY_QUIZ_PAGE:
          Flyy.navigateToQuizActivity(this, QUIZ_ID);
          break;
        case FLYY_QUIZ_HISTORY_PAGE:
          Flyy.navigateToQuizHistoryActivity(this);
          break;
        case FLYY_QUIZ_LIST_PAGE:
          Flyy.navigateToQuizListActivity(this);
          break;
        case FLYY_STAMPS_PAGE:
          if (getIntent().getStringExtra(SEGMENT_ID) != null) {
            Flyy.navigateToStampActivity(this, getIntent().getStringExtra(SEGMENT_ID));
          } else {
            Flyy.navigateToStampActivity(this);
          }
          break;
        case FLYY_INVITE_DETAILS_PAGE:
          Flyy.navigateToInviteDetailActivity(this, OFFER_ID);
        default:
          throw new IllegalStateException("Unexpected value: " + activityToOpen);
      }
    finish();
  }


}
