import { HttpStatusCode } from '@ohos/axios';
import { axiosInstance } from '../apis/HttpRequest';
import { RequestUrl } from '../types/RequestUrl';
import { AxiosMock } from './AxiosMock';
import { USER_INFO, USER_LOGIN } from './mockdata/UserInfo';

/**
 * Axios实例一致,则拦截;
 * Axios实例不一致,则不影响.
 */
const mock: AxiosMock = new AxiosMock(axiosInstance, {
  delayResponse: 800,
});

// 用户登录信息
mock.onPost(RequestUrl.URL_USER_LOGIN).reply(async () => {
  return {
    status: HttpStatusCode.Ok,
    data: USER_LOGIN,
  };
});

// 用户获取信息
mock.onGet(RequestUrl.URL_USER_INFO).reply(async () => {
  return {
    status: HttpStatusCode.Ok,
    data: USER_INFO,
  };
});