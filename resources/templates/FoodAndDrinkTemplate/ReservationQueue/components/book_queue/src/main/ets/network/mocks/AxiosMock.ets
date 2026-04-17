import axios, {
  InternalAxiosRequestConfig,
  AxiosRequestConfig,
  AxiosAdapter,
  AxiosError,
  AxiosInstance,
  AxiosPromise,
  AxiosResponse,
} from '@ohos/axios';

export interface MockResponse {
  status: number;
  data?: object | string;
}

type MockCallback = (config: AxiosRequestConfig) => Promise<MockResponse>;

interface RequestHandler { reply: (callback: MockCallback) => void }

interface MockAdapterOptions { delayResponse?: number }

interface MockHandler {
  url: string;
  method: string;
  callback: MockCallback;
}

export class AxiosMock {
  private _axiosInstance: AxiosInstance;
  private _originalAdapter: AxiosAdapter;
  private _axiosInstanceWithoutInterceptors: AxiosInstance;
  private _handlers: MockHandler[] = [];
  private _globalHandler: MockHandler | null = null;
  private _delayResponse: number = 0;

  constructor(axiosInstance: AxiosInstance, options: MockAdapterOptions = {}) {
    this._axiosInstance = axiosInstance;
    this._originalAdapter = axiosInstance.defaults.adapter as AxiosAdapter;
    this._axiosInstanceWithoutInterceptors = axios.create();
    this._axiosInstance.defaults.adapter = this._adapter();
    this._delayResponse = options.delayResponse || 0;
  }

  public onGet(url: string): RequestHandler {
    return this._onRequest('get', url);
  }

  public onPut(url: string): RequestHandler {
    return this._onRequest('put', url);
  }

  public onPost(url: string): RequestHandler {
    return this._onRequest('post', url);
  }

  public onDelete(url: string): RequestHandler {
    return this._onRequest('delete', url);
  }

  public onAny(): RequestHandler {
    return {
      reply: (callback: MockCallback) => {
        const handler: MockHandler = { url: '', method: 'any', callback: callback };
        this._globalHandler = handler;
      },
    };
  }

  private _onRequest(method: string, url: string): RequestHandler {
    return {
      reply: (callback: MockCallback) => {
        const handler: MockHandler = { url, method, callback };
        this._addHandler(handler);
      },
    };
  }

  private _addHandler(handler: MockHandler): void {
    this._handlers.push(handler);
  }

  private _adapter(): AxiosAdapter {
    return async (config: InternalAxiosRequestConfig): AxiosPromise => {
      config.adapter = undefined;
      const handler = this._handlers.find(item => item.url === config.url && item.method === config.method);
      if (handler) {
        return this._getResponse(config, handler.callback, this._delayResponse);
      } else if (this._globalHandler !== null) {
        return this._getResponse(config, this._globalHandler.callback, this._delayResponse);
      } else {
        const newConfig = this._assign({}, config);
        newConfig.adapter = this._originalAdapter;
        return this._axiosInstanceWithoutInterceptors(newConfig);
      }
    };
  }

  private async _getResponse(config: InternalAxiosRequestConfig, callback: MockCallback, delay: number): AxiosPromise {
    if (delay > 0) {
      const promise: Promise<void> = new Promise((resolve: Function) => {
        setTimeout(resolve, delay);
      });
      await promise;
    }
    const resp: MockResponse = await callback(config);
    const axiosResp: AxiosResponse = {
      data: resp.data,
      status: resp.status,
      statusText: resp.status.toString(),
      headers: {},
      config: config,
    };
    if (config.validateStatus && !config.validateStatus(resp.status)) {
      const error: AxiosError = AxiosError.from(
        new Error('Request failed with status code ' + resp.status),
        resp.status.toString(),
        config,
        null,
        axiosResp,
      );
      return Promise.reject(error);
    }
    return axiosResp;
  }

  private _assign(target: Record<string, Object>, ...source: Object[]): Record<string, Object> {
    for (const items of source) {
      for (const key of Object.keys(items)) {
        target[key] = Reflect.get(items, key);
      }
    }
    return target;
  }
}
