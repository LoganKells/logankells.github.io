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

## References

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map