import axios, {
  AxiosAdapter,
  AxiosError,
  AxiosInstance,
  AxiosPromise,
  AxiosRequestConfig,
  AxiosResponse,
  InternalAxiosRequestConfig,
} from '@ohos/axios';

export interface MockResponse {
  status: number;
  data?: object;
}

type MockCallback = (config: AxiosRequestConfig) => Promise<MockResponse>;

interface MockHandler {
  url: string;
  method: string;
  callback: MockCallback;
}

interface RequestHandler {
  reply: (callback: MockCallback) => void;
}

interface MockAdapterOptions {
  delayResponse?: number;
}

export class AxiosMock {
  private _axiosInstance: AxiosInstance;
  private _originalAdapter: AxiosAdapter;
  private _axiosInstanceWithoutInterceptors: AxiosInstance;
  private _handlers: MockHandler[] = [];
  private _globalHandler: MockHandler | null = null;
  private _delayResponse: number = 0;

  constructor(instance: AxiosInstance, options: MockAdapterOptions = {}) {
    this._axiosInstance = instance;
    this._originalAdapter = instance.defaults.adapter as AxiosAdapter;
    this._axiosInstance.defaults.adapter = this._adapter();
    this._axiosInstanceWithoutInterceptors = axios.create();
    this._delayResponse = options.delayResponse || 0;
  }

  public onGet(url: string): RequestHandler {
    return this._onRequest('get', url);
  }

  public onPost(url: string): RequestHandler {
    return this._onRequest('post', url);
  }

  public onPut(url: string): RequestHandler {
    return this._onRequest('put', url);
  }

  public onDelete(url: string): RequestHandler {
    return this._onRequest('delete', url);
  }

  public onAny(): RequestHandler {
    return {
      reply: (callback: MockCallback) => {
        const handler: MockHandler = {
          url: '',
          method: 'any',
          callback: callback,
        };
        this._globalHandler = handler;
      },
    };
  }

  private _onRequest(method: string, url: string): RequestHandler {
    return {
      reply: (callback: MockCallback) => {
        const handler: MockHandler = {
          url,
          method,
          callback,
        };
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
      const handler = this._handlers.find(
        (item) => item.url === config.url && item.method === config.method,
      );
      if (handler) {
        return this._getRespose(config, handler.callback, this._delayResponse);
      } else if (this._globalHandler !== null) {
        return this._getRespose(config, this._globalHandler.callback, this._delayResponse);
      } else {
        const newConfig = this._assign({}, config);
        newConfig.adapter = this._originalAdapter;
        return this._axiosInstanceWithoutInterceptors(newConfig);
      }
    };
  }

  private async _getRespose(config: InternalAxiosRequestConfig, callback: MockCallback, delay: number): AxiosPromise {
    if (delay > 0) {
      const promise: Promise<void> = new Promise((resolve: Function) => {
        setTimeout(resolve, delay);
      });
      await promise;
    }
    const response: MockResponse = await callback(config);
    const axiosResp: AxiosResponse = {
      data: response.data,
      status: response.status,
      statusText: response.status.toString(),
      headers: {},
      config: config,
    };
    if (config.validateStatus && !config.validateStatus(response.status)) {
      const error: AxiosError = AxiosError.from(
        new Error('Request failed with status code ' + response.status),
        response.status.toString(),
        config,
        null,
        axiosResp,
      );
      return Promise.reject(error);
    }
    return axiosResp;
  }

  private _assign(target: Record<string, Object>, ...sources: Object[]): Record<string, Object> {
    for (const items of sources) {
      for (const key of Object.keys(items)) {
        target[key] = Reflect.get(items, key);
      }
    }
    return target;
  }
}
