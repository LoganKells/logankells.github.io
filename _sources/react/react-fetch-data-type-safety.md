# Fetch Data with Type Safety in React

*Last Updated: October 3, 2023*

[My project source code is available here](https://github.com/LoganKells/meta-front-end-developer/tree/develop/course-6-advanced-react/lab-fetching-data-type-safety)

## Overview

In this tutorial, we will learn how to fetch data with type safety 
in React using TypeScript and the Fetch API.

## Files

### BitcoinData.tsx

:::{note}

The TypeScript `type bitcoinDataType` is used to define the shape of the data
response from the Fetch API. This is used to ensure type safety when accessing
the data.

Also, when we initialize the state of the `coinData` object, we use the
`bitcoinDataType` type to ensure type safety. The initial state of
the `coinData` object is an empty `bitcoinDataType` object.

```jsx
const [coinData, setCoinData] = useState<bitcoinDataType>({
    bpi: {
      EUR: {
        code: "",
        description: "",
        rate: "",
        rate_float: 0,
        symbol: "",
      },
      GBP: { code: "", description: "", rate: "", rate_float: 0, symbol: "" },
      USD: { code: "", description: "", rate: "", rate_float: 0, symbol: "" },
    },
    chartName: "",
    disclaimer: "",
    time: { updated: "", updatedISO: "", updateduk: "" },
  });
```
:::

<h5 a><strong><code>BitcoinData.tsx</code></strong></h5>

```jsx
import { useEffect, useState } from "react";

type bitcoinDataType = {
  time: {
    updated: string;
    updatedISO: string;
    updateduk: string;
  };
  disclaimer: string;
  chartName: string;
  bpi: {
    USD: {
      code: string;
      symbol: string;
      rate: string;
      description: string;
      rate_float: Number;
    };
    GBP: {
      code: string;
      symbol: string;
      rate: string;
      description: string;
      rate_float: Number;
    };
    EUR: {
      code: string;
      symbol: string;
      rate: string;
      description: string;
      rate_float: Number;
    };
  };
};

function BitcoinData() {
  // State
  const [coinData, setCoinData] = useState<bitcoinDataType>({
    bpi: {
      EUR: {
        code: "",
        description: "",
        rate: "",
        rate_float: 0,
        symbol: "",
      },
      GBP: { code: "", description: "", rate: "", rate_float: 0, symbol: "" },
      USD: { code: "", description: "", rate: "", rate_float: 0, symbol: "" },
    },
    chartName: "",
    disclaimer: "",
    time: { updated: "", updatedISO: "", updateduk: "" },
  });
  function fetchData() {
    fetch("https://api.coindesk.com/v1/bpi/currentprice.json")
      .then((response) => response.json())
      .then((data) => setCoinData(data))
      .catch((error) => console.log(error));
  }

  // Only fetch data on first render
  useEffect(() => {
    fetchData();
  }, []);

  useEffect(() => {
    console.log(coinData);
    console.log("length: ", Object.keys(coinData).length);
  }, [coinData]);

  return Object.keys(coinData).length === 0 ? (
    <div>
      <h1>Loading data</h1>
    </div>
  ) : (
    <div>
      <h1>{"USD: $" + coinData["bpi"]["USD"]["rate_float"]}</h1>
      <h2>{"Last Updated: " + coinData["time"]["updated"]}</h2>
    </div>
  );
}

export { BitcoinData };
```

### App.tsx

This file simply renders the `<BitcoinData />` component.

<h5 a><strong><code>App.tsx</code></strong></h5>

```jsx
import React from "react";
import "./App.css";
import { BitcoinData } from "./BitcoinData";

function App() {
  return (
    <div className="App">
      <BitcoinData />
    </div>
  );
}

export default App;
```

### index.tsx

This file is the entry point for the React application.

<h5 a><strong><code>index.tsx</code></strong></h5>

```jsx
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
```

## References

- [React TypeScript Cheatsheets](https://www.typescriptlang.org/static/TypeScript%20Types-ae199d69aeecf7d4a2704a528d0fd3f9.png)
- [Coindesk public API](https://publicapis.io/coin-desk-api)