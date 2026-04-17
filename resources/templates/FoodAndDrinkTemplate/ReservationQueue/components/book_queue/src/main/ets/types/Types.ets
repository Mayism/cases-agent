import { BookOrderDetail } from '../network/types/ResponseTypes';

export enum GenderStatus {
  UNDEFINED = 0,
  MALE,
  FEMALE,
}

export interface BookOrderModel extends BookOrderDetail {
  schedule: boolean;
}
