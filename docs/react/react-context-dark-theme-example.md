# Creating A Light/Dark Themed React App Using Context

*Last Updated: October 2, 2023*

[My project source code is available here](https://github.com/LoganKells/meta-front-end-developer/tree/develop/course-6-advanced-react/lab-light-dark-theme-using-context)

## Overview

React Context is a way to pass data through the component tree without having to pass props down manually at every
level.
In this app, I've created a basic light/dark theme switcher using React Context.

## Files

### App.js

:::{note}
We can see the context provider is defined in the App component of App.js.

```jsx
function Root() {
    return (
        <ThemeProvider>
            <App/>
        </ThemeProvider>
    );
}
```

We can avoid re-rendering of components in the context tree using memoization in React.

https://react.dev/reference/react/memo#memo

This is applied using the `memo()` function hook.

```jsx
import {memo} from "react";

const App = memo(() => {
});
```

:::
<h5 a><strong><code>App.js</code></strong></h5>

```jsx
import "./App.css";
import {ThemeProvider, useTheme} from "./ThemeContext";
import Switch from "./Switch";
import {memo} from "react";

const Title = ({children}) => {
    const {theme, toggleTheme} = useTheme();
    return (
        <h2
            style={{
                color: theme === "light" ? "black" : "white",
            }}
        >
            {children}
        </h2>
    );
};

const Paragraph = ({children}) => {
    const {theme, toggleTheme} = useTheme();
    return (
        <p
            style={{
                color: theme === "light" ? "black" : "white",
            }}
        >
            {children}
        </p>
    );
};

const Content = () => {
    return (
        <div>
            <Paragraph>
                We are a pizza loving family. And for years, I searched and searched and
                searched for the perfect pizza dough recipe. I tried dozens, or more.
                And while some were good, none of them were that recipe that would make
                me stop trying all of the others.
            </Paragraph>
        </div>
    );
};

const Header = () => {
    return (
        <header>
            <Title>Little Lemon</Title>
            <Switch/>
        </header>
    );
};

const Page = () => {
    return (
        <div className="Page">
            <Title>When it comes to dough</Title>
            <Content/>
        </div>
    );
};

// using memoization: https://react.dev/reference/react/useMemo#skipping-re-rendering-of-components
const App = memo(() => {
    const {theme, toggleTheme} = useTheme();
    return (
        <div
            className="App"
            style={{
                backgroundColor: theme === "light" ? "white" : "black",
            }}
        >
            <Header/>
            <Page/>
        </div>
    );
});

function Root() {
    return (
        <ThemeProvider>
            <App/>
        </ThemeProvider>
    );
}

export default Root;
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
const ThemeProvider = ({children}) => {
}
```

:::

<h5 a><strong><code>ThemeContext.js</code></strong></h5>

```jsx
import {createContext, useContext, useState} from "react";

const ThemeContext = createContext(undefined);

const ThemeProvider = ({children}) => {
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
export {ThemeProvider, useTheme};
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
import {useTheme} from "../ThemeContext";

const Switch = () => {
    // Use the useTheme hook to get access to `theme` and `toggleTheme`
    const {theme, toggleTheme} = useTheme();

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
            <span className="slider round"/>
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
        <App/>
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
- [My project source code is available here](https://github.com/LoganKells/meta-front-end-developer/tree/develop/course-6-advanced-react/lab-light-dark-theme-using-context)
