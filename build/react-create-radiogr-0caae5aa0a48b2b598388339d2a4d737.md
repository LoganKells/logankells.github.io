# Create a RadioGroup Component Dynamically

*Last Updated: October 18, 2023*

[My project source code is available here](https://github.com/LoganKells/meta-front-end-developer/tree/develop/course-6-advanced-react/lab-build-radio-group-component)

## Overview
In React, we can create a radio group component dynamically using the React.Children.map() function. This
will allow us to create a radio group component that can be used to render a list of radio buttons.

Rendering the RadioGroup component dynamically allows us to create a reusable component that can be used
to render a list of radio buttons. Below is an example of rendering radio buttons manually, which 
is not reusable. Review the App.jsx file in the Files section below for a complete example.

:::{note}
In this original implementation of App component, we are repeating the props `checked` and `onChange` in every
RadioOption component. This is not following DRY (Don't Repeat Yourself) principles. We can improve this
using the `React.Children.map()` function and the `React.cloneElement()` function using the
component composition paradigm to create the RadioGroup component.
:::

```jsx
function App() {
  const [selected, setSelected] = useState("");
  const handleChange = (e) => e.target.value === selected
  return (
    <div className="App">
      <h2>How did you hear about Little Lemon?</h2>
      <RadioGroup onChange={setSelected} selected={selected}>
        <RadioOption value="social_media" checked={false} onChange={handleChange}>Social Media</RadioOption>
        <RadioOption value="friends" checked={false} onChange={handleChange}>Friends</RadioOption>
        <RadioOption value="advertising" checked={false} onChange={handleChange}>Advertising</RadioOption>
        <RadioOption value="other" checked={false} onChange={handleChange}>Other</RadioOption>
      </RadioGroup>
      <button disabled={!selected}>Submit</button>
    </div>
  );
}
```

## Files

### App.jsx

:::{note}
In App.jsx we are only passing the value to each `RadioOption` component. The `RadioGroup` component
is using the `React.Children.map()` function and the `React.cloneElement()` function to clone the
children and pass the correct props to each `RadioOption` component.
:::

<h5 a><strong><code>App.jsx</code></strong></h5>

```jsx
import "./App.css";
import { RadioGroup, RadioOption } from "./Radio";
import { useState } from "react";

/**
 * App displays a radio group built using component composition dynamically.
 * */
function App() {
  const [selected, setSelected] = useState("");
  // console.log("selected:", selected);
  return (
    <div className="App">
      <h2>How did you hear about Little Lemon?</h2>
      <RadioGroup onChange={setSelected} selected={selected}>
        <RadioOption value="social_media">Social Media</RadioOption>
        <RadioOption value="friends">Friends</RadioOption>
        <RadioOption value="advertising">Advertising</RadioOption>
        <RadioOption value="other">Other</RadioOption>
      </RadioGroup>
      <button disabled={!selected}>Submit</button>
    </div>
  );
}

export default App;

```

### Radio/index.jsx

:::{note}
In `Radio/index.jsx` the `RadioGroup` component
is using the `React.Children.map()` function and the `React.cloneElement()` function to clone the
children and pass the correct props to each `RadioOption` component.

The `RadioOption` component is using the `onChange` prop passed to the `RadioGroup` component and
then passed to the `RadioOption` component to handle the `onChange` event. The `checked` prop is
also passed to the `RadioOption` component to handle the `checked` state of the radio button.
:::

<h5 a><strong><code>Radio/index.jsx</code></strong></h5>

```jsx
import * as React from "react";
import "./styles.css";

export const RadioGroup = ({ onChange, selected, children }) => {
  // Use React.Children.map and React.cloneElement to clone the children
  // and pass the correct props to each RadioOption
  const RadioOptions = React.Children.map(children, (child) => {
    return React.cloneElement(child, {
      ...child.props,
      onChange: onChange,
      checked: child.props.value === selected,
    });
  });
  return <div className="RadioGroup">{RadioOptions}</div>;
};

export const RadioOption = ({ value, checked, onChange, children }) => {
  // Hook up the onChange handler to call the onChange prop passed to RadioGroup
  // Also, make sure to pass the correct checked prop to the input element
  return (
    <div className="RadioOption">
      <input
        id={value}
        type="radio"
        name={value}
        value={value}
        checked={checked}
        onChange={(e) => {
          onChange(e.target.value);
        }}
      />
      <label htmlFor={value}>{children}</label>
    </div>
  );
};

```