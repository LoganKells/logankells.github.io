# Rendering a list in React

*Last Updated: September 26, 2023*

[My project source code is available here]()

## Overview

We can render a list of items in React using the `map()` function.

## Files

:::{note}
We can render a list of items in React using the `map()` function.

```jsx
const listItems = desserts.map((data) => {
    const itemText = `data.title`;
    return <li key={data.id}>{itemText}</li>;
  });
  return <ul>{listItems}</ul>;
```
:::

### Food.js

<h5 a><strong><code>Food.js</code></strong></h5>

```jsx
const desserts = [
  {
    id: "1",
    title: "Tiramisu",
    description: "The best in town",
    price: "$5.00",
  },
  {
    id: "2",
    title: "Lemon Ice Cream",
    description: "Mind blowing taste",
    price: "$4.50",
  },
  {
    id: "3",
    title: "Chocolate mousse",
    description: "Unexplored flavours",
    price: "$6.00",
  },
];

/**
 * Simple Food list
 * */
function Food() {
  // using React key to help React diff algorithm
  // https://react.dev/learn/rendering-lists#keeping-list-items-in-order-with-key
  const listItems = desserts.map((dessert) => {
    const itemText = `${dessert.title} - ${dessert.price}`;
    return <li key={dessert.id}>{itemText}</li>;
  });
  return <ul>{listItems}</ul>;
}

export { Food };
```

### App.js

:::{note}
This `App.js` from create-react-app is only modified to include the `<Food />` component.
:::

<h5 a><strong><code>App.js</code></strong></h5>

```jsx
import logo from "./logo.svg";
import "./App.css";
import { Food } from "./Food";

function App() {
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
        <Food />
      </header>
    </div>
  );
}

export default App;
```

### ThemeContext.js

:::{note}
The ThemeContext.js file contains the context provider and the context.

The context is defined using the `createContext` method.

```jsx
const ThemeContext = createContext(undefined);
```

The context provider is defined as a component with the '{children}' prop.

```jsx
const ThemeProvider = ({ children }) => {}
```
:::

<h5 a><strong><code>ThemeContext.js</code></strong></h5>

```jsx
import { createContext, useContext, useState } from "react";

const ThemeContext = createContext(undefined);

const ThemeProvider = ({ children }) => {
  // Give the child component a `theme` state
  const [theme, setTheme] = useState("light");

  // Return a `ThemeContext.Provider` component that receives an object
  // as its value prop, with a `theme` string and a `toggleTheme` function
  return (
    // https://react.dev/reference/react/createContext#provider
    // Wrap your components into a context provider to specify
    // the value of this context for all components inside:
    <ThemeContext.Provider
      value={{
        theme: theme,
        toggleTheme: () => setTheme(theme === "light" ? "dark" : "light"),
      }}
    >
      {children}
    </ThemeContext.Provider>
  );
};

// Change `useTheme` so that it returns `useContext(ThemeContext);`
// instead of the `{theme: "light"}` object
const useTheme = () => useContext(ThemeContext);

// export const ThemeProvider = ({ children }) => children;
// export const useTheme = () => ({ theme: "light" });
export { ThemeProvider, useTheme };
```

### Switch/index.js
The Switch component is a simple checkbox that toggles the theme when clicked.

:::{note}
The Switch component is located in ./Switch directory with 
the filename `index.js` and `Styles.css` 
to bundle the component with the custom CSS.
:::

<h5 a><strong><code>./Switch/index.js</code></strong></h5>

```jsx
import "./Styles.css";
import { useTheme } from "../ThemeContext";

const Switch = () => {
  // Use the useTheme hook to get access to `theme` and `toggleTheme`
  const { theme, toggleTheme } = useTheme();

  // Add an `onChange` prop to the input element. When them element changes,
  // the `toggleTheme` function should be invoked
  // Change the `checked` prop to be true or false based on the `theme` state.
  return (
    <label className="switch">
      <input
        type="checkbox"
        checked={theme === "light"}
        onChange={toggleTheme}
      />
      <span className="slider round" />
    </label>
  );
};

export default Switch;
```

### index.js

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

- https://react.dev/reference/react/useContext
- https://react.dev/reference/react/useMemo#skipping-re-rendering-of-components