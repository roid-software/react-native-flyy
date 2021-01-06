import * as React from 'react';

import { StyleSheet, View, TextInput, TouchableOpacity, Text } from 'react-native';
import Flyy from 'react-native-flyy';


export default class App extends React.Component {

  componentDidMount() {
  console.log(Flyy)
    Flyy.initSDK("e6ba6f017fd8712b6fad", Flyy.PRODUCTION);
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
      Flyy.setUserName(this.state.name);
      Flyy.openOffersScreen();
      // Flyy.openReferralHistory();
      const data = {
        "platform": "Android",
        "react": "native_test",
        "this": "works"
      }
      Flyy.sendEvent("platform_info", JSON.stringify(data));
      // Flyy.openRewardsScreen();
      // Flyy.openWalletScreen();
      // Flyy.openGiftCardScreen();
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
