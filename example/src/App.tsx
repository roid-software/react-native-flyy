import * as React from 'react';

import { StyleSheet, View, TextInput, TouchableOpacity, Text } from 'react-native';
import Flyy from 'react-native-flyy';


export default class App extends React.Component {

  componentDidMount() {
    Flyy.setPackageName("");
    //initalize flyy sdk
    Flyy.initSDK("e6ba6f017fd8712b6fad", Flyy.PRODUCTION);

    // debugger
        // Flyy.initSDKWithReferralCallback("e6ba6f017fd8712b6fad", Flyy.PRODUCTION,
        // (referralData) => {
        //   debugger
        //   console.log(`Callback value referralData ${referralData}`);
        // });
  }

  render() {
    return (
      <View style={styles.main}>
        <View style={styles.container}>
          <TextInput style={styles.input}
            placeholder="Enter your name"
            onChangeText={(text) => this.setState({ name: text })}
            keyboardType='default' />

          <TextInput style={styles.input}
            placeholder="Enter your contact number"
            onChangeText={(text) => this.setState({ number: text })}
            keyboardType='number-pad' />

          <TouchableOpacity
            style={styles.button}
            onPress={() =>
              this.openOffersScreen()
            }>
            <Text style={styles.buttonText}>LOGIN</Text>
          </TouchableOpacity>
        </View>
      </View>
    )
  }

  openOffersScreen() {
    if (this.state != null && this.state.name != null && this.state.name != "" &&
      this.state.number != null && this.state.number != "") {
    

       Flyy.setUser(this.state.number);

      //set user with callback
      // Flyy.setUserWithCallBack(
      //    this.state.number,
      //   (success) => {
      //               console.log(`Callback value for set user ${success}`);
      //   }
      // );

      //set user name
      Flyy.setUserName(this.state.name);

      // const data = {
      //   "platform": "Android",
      //   "react": "native_test",
      //   "this": "works"
      // }
      // //send json event with callback
      // Flyy.sendEventWithCallBack(
      //       "platform_info",  JSON.stringify(data),
      //       (success) => {
      //            console.log(`Callback value for send event ${success}`);
      //       }
      // );

      //open offers screen
      Flyy.openOffersScreen();

      //open referrals history screen
      //Flyy.openReferralHistory();

      //open rewards screen
      //Flyy.openRewardsScreen();

      //open wallet screen
      //Flyy.openWalletScreen();

      //open gift cards screen
      //Flyy.openGiftCardScreen();
    } else {
      console.log("Name and Number are mandatory fields");
    }
  }

}

const styles = StyleSheet.create({
  main: {
    height: '100%',
    width: '100%',
    backgroundColor: 'white',
    alignItems: 'center',
    justifyContent: 'space-between'
  },
  container: {
    height: '100%',
    width: '80%',
    alignItems: 'center',
    justifyContent: 'center',
  },
  input: {
    height: 40,
    width: '100%',
    borderRadius: 10,
    borderColor: 'deepskyblue',
    borderWidth: 1,
    padding: 10,
    margin: 25,
  },
  buttonText: {
    textAlign: 'center',
    fontWeight: 'bold',
    fontSize: 18,
    color: 'white'
  },
  button: {
    width: 150,
    height: 50,
    backgroundColor: 'deepskyblue',
    textAlign: 'center',
    borderRadius: 20,
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: 30
  }
});
