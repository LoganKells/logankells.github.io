# Creating A Light/Dark Themed React App Using Context

*Last Updated: September 26, 2023*

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
      <App />
    </ThemeProvider>
  );
}
```
:::

<h5 a><strong><code>App.js</code></strong></h5>

```jsx
import "./App.css";
import { ThemeProvider, useTheme } from "./ThemeContext";
import Switch from "./Switch";

const Title = ({ children }) => {
  const { theme, toggleTheme } = useTheme();
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

const Paragraph = ({ children }) => {
  const { theme, toggleTheme } = useTheme();
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
      <Switch />
    </header>
  );
};

const Page = () => {
  return (
    <div className="Page">
      <Title>When it comes to dough</Title>
      <Content />
    </div>
  );
};

function App() {
  const { theme, toggleTheme } = useTheme();
  return (
    <div
      className="App"
      style={{
        backgroundColor: theme === "light" ? "white" : "black",
      }}
    >
      <Header />
      <Page />
    </div>
  );
}

function Root() {
  return (
    <ThemeProvider>
      <App />
    </ThemeProvider>
  );
}

export default Root;
```

## References

- https://react.dev/reference/react/useContext