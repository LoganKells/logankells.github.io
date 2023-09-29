# Updating State with Arrow Functions

*Last Updated: September 26, 2023*

[My project source code is available here](https://github.com/LoganKells/meta-front-end-developer/tree/develop/course-6-advanced-react/lab-update-state-with-arrow-function)

## Overview

We can update state in React using arrow functions. In this example, we are updating the state of a user object by
iterating the `id` property each time a button is clicked.

## Files

### App.js

:::{note}
The user object `data` is using the `useState()` hook. The `id` property is being updated using the `updateData()`
callback function.
```jsx
const [data, setData] = useState({ id: 0, name: "Logan", lastName: "Kells" });
  let [clickCount, setClickCount] = useState(0);
  function updateData() {
    setClickCount(++clickCount);
    setData((prevValue) => {
      return { ...prevValue, id: clickCount };
    });
  }
```

We can see the arrow function is being used in the `setData()` function to update the `id` property of the `data` object.
```jsx
setData((prevValue) => {
    return { ...prevValue, id: clickCount };
});
```

Finally, note the useage of `useEffect()` to handle side effects. 
In this case, we are logging the `data` object to the console.
```jsx
useEffect(() => {
    console.log(data);
  }, [data]);
```
:::

<h5 a><strong><code>App.js</code></strong></h5>

```jsx
import logo from "./logo.svg";
import "./App.css";
import { useEffect, useState } from "react";

function App() {
  const [data, setData] = useState({ id: 0, name: "Logan", lastName: "Kells" });
  let [clickCount, setClickCount] = useState(0);
  function updateData() {
    setClickCount(++clickCount);
    setData((prevValue) => {
      return { ...prevValue, id: clickCount };
    });
  }

  useEffect(() => {
    console.log(data);
  }, [data]);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
      <button onClick={updateData}>Update Data</button>
    </div>
  );
}

export default App;
```

### Index.js

<h5 a><strong><code>index.js</code></strong></h5>

```jsx
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(document.getElementById('root'));
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

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions
- https://react.dev/reference/react/useState#updating-objects-and-arrays-in-state
- [My project source code is available here](https://github.com/LoganKells/meta-front-end-developer/tree/develop/course-6-advanced-react/lab-update-state-with-arrow-function)
