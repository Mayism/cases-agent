import { AxiosResponse } from '@ohos/axios';
import '../mocks/RequestMock';
import { RequestUrl } from '../types/RequestUrl';
import { axiosInstance } from './HttpRequest';
import { UserLoginResp } from '../types/ResponseTypes';
import { UserInfo } from '../../types/UserInfo';

// 用户登录信息
export const userLoginApi = (): Promise<AxiosResponse<UserLoginResp, void>> => {
  return axiosInstance.post(RequestUrl.URL_USER_LOGIN);
};

// 用户获取信息
export const getUserInfoApi = (): Promise<AxiosResponse<UserInfo, void>> => {
  return axiosInstance.get(RequestUrl.URL_USER_INFO);
};