# Managing State Within a React Component

## Overview

This guide will show you how to manage state within a React component.
It will also show you how to update state using the `setState` method.
Finally, we use the `useEffect` hook to control when the component re-renders.

## Files

### App.js

:::{note}
When the user clicks the button, the `spendGiftCard` function is called.

```jsx
<button onClick={spendGiftCard}>Spend Gift Card</button>
}
```

This changes the component state

```jsx
function spendGiftCard() {
    setGiftCard((prev) => {
        return {
            ...prev,
            valid: false,
            text: "Your coupon has been used.",
            instructions: "Please visit our restaurant to renew your gift card.",
        };
    });
}
```

Finally, we use the `useEffect` hook to control when the component re-renders.
We update the document title when the `giftCard` object changes.

```jsx
useEffect(() => {
    document.title = giftCard.valid ? "Gift Available!" : "Welcome!";
}, [giftCard]);
```

:::

<h5 a><strong><code>App.js</code></strong></h5>

```jsx
import {useEffect, useState} from "react";

export default function App() {
    const [giftCard, setGiftCard] = useState({
        firstName: "Jennifer",
        lastName: "Smith",
        text: "Free dinner for 4 guests",
        valid: true,
        instructions: "To use your coupon, click the button below.",
    });
    
    function spendGiftCard() {
        setGiftCard((prev) => {
            return {
                ...prev,
                valid: false, 
                text: "Your coupon has been used.",
                instructions: "Please visit our restaurant to renew your gift card.",
            };
        });
    }

    useEffect(() => {
        document.title = giftCard.valid ? "Gift Available!" : "Welcome!";
    }, [giftCard]);

    return (
        <div style={{padding: "40px"}}>
            <h1>Gift Card Page</h1>
            <h2>
                Customer: {giftCard.firstName} {giftCard.lastName}
            </h2>
            <h3>{giftCard.text}</h3>
            <p>{giftCard.instructions}</p>
            {giftCard.valid && (
                <button onClick={spendGiftCard}>Spend Gift Card</button>
            )}
        </div>
    );
}
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

- https://react.dev/reference/react/useEffect
- https://react.dev/reference/react/useState
