import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

import rootReducer from './modules';
import { legacy_createStore as createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import myLogger from './middleware/myLogger';
import { composeWithDevTools } from '@redux-devtools/extension';

import ReduxThunk from 'redux-thunk';
import { BrowserRouter } from 'react-router-dom';

// 리덕스 데브툴즈 적용 composeWithDevTools()
// 미들웨어 적용 applyMiddleware(미들웨어1, 미들웨어2)
const store = createStore(rootReducer, composeWithDevTools(applyMiddleware(ReduxThunk, myLogger)))

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <BrowserRouter>
    <Provider store = {store}>
    <App />
    </Provider>
    </BrowserRouter>
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
