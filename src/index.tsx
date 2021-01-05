import { NativeModules } from 'react-native';

type FlyyType = {
  multiply(a: number, b: number): Promise<number>;
};

const { Flyy } = NativeModules;

export default Flyy as FlyyType;
