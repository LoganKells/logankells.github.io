# Create a Custom Hook, usePrevious, in React

*Last Updated: October 4, 2023*

[My project source code is available here](https://github.com/LoganKells/meta-front-end-developer/tree/develop/course-6-advanced-react/lab-create-custom-hook-usePrevious)

## Overview
In React, a custom hook is a JavaScript function whose name starts with `use` and that may call other hooks. 
For example, the custom hook created in this guide, `usePrevious`, is a custom hook that calls the `useRef` hook 
and the `useEffect` hook from React.

## Files

### usePrevious.js

The `usePrevious` custom hook that calls the `useRef` hook
and the `useEffect` hook from React. 

:::{note}
Custom React hooks should go in a new module file and be named with the `use` prefix, in this case
`usePrevious.js`.

The value input parameter `val` is stored in a JavaScript object literal,
prevVal, and returned when the hook is called. The hook is called
anytime the val value changes in the component because useEffect is
observing the dependency `[val]`.

:::

<h5 a><strong><code>usePrevious.js</code></strong></h5>

```jsx
import { useEffect, useRef } from "react";

/**
 * usePrevious is a custom hook. 
 * */
function usePrevious(val) {
  const prevVal = useRef("");
  useEffect(() => {
    console.log("next previous value:", val);
    prevVal.current = val;
  }, [val]);
  return prevVal.current;
}

export { usePrevious };
```

### App.js

The application component that uses the `usePrevious` custom hook to display 
the `prevDay` of the week offset
from the active `day`.

<h5 a><strong><code>App.js</code></strong></h5>

```jsx
import { useState, useEffect, useRef } from "react";
import { usePrevious } from "./usePrevious";

export default function App() {
  const [day, setDay] = useState("Monday");
  const prevDay = usePrevious(day);
  const getNextDay = () => {
    if (day === "Monday") {
      setDay("Tuesday");
    } else if (day === "Tuesday") {
      setDay("Wednesday");
    } else if (day === "Wednesday") {
      setDay("Thursday");
    } else if (day === "Thursday") {
      setDay("Friday");
    } else if (day === "Friday") {
      setDay("Monday");
    }
  };
  return (
    <div style={{ padding: "40px" }}>
      <h1>
        Today is: {day}
        <br />
        {prevDay && <span>Previous work day was: {prevDay}</span>}
      </h1>
      <button onClick={getNextDay}>Get next day</button>
    </div>
  );
}
```

## References

- [Reusing Logic with Custom Hooks | React Docs](https://react.dev/learn/reusing-logic-with-custom-hooks)
- [Create your own custom hook, usePrevious | Meta](https://www.coursera.org/learn/advanced-react/ungradedLab/d3fkC/exercise-create-your-own-custom-hook-useprevious)
