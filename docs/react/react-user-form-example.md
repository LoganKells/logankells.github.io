# Creating React User Forms

[My project source code is available here](https://github.com/LoganKells/meta-front-end-developer/tree/develop/course-6-advanced-react/lab-create-registration-form).

## Overview

User forms are critical in React for collecting user input. In this lab I've created a user input form for
registering a new user.

## Files

### App.js
The React app is contained in the App component.
The App component contains the form and the form validation logic.

The user form is defined in React and includes the `onSubmit` prop. 
The `onSubmit` prop is a function that is called when the form is submitted.

The various input fields are defined in the form. Each input field has an `onChange` prop.
The password input type also has an `onBlur` prop.

```jsx
<form onSubmit={handleSubmit}>
```

```jsx
import "./App.css";
import { useState } from "react";
import { validateEmail } from "./utils";

const PasswordErrorMessage = () => {
  return (
    <p className="FieldError">Password should have at least 8 characters</p>
  );
};

function App() {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState({
    value: "",
    isTouched: false,
  });
  const [role, setRole] = useState("role");

  const getIsPasswordValid = () => {
    // Implement this function
    return password.value.length >= 8 && password.isTouched;
  };

  const getisRoleValid = () => {
    return role === "individual" || role === "business";
  };

  const getIsEmailValid = () => {
    let validationResult = validateEmail(email);
    if (validationResult !== null && validateEmail(email).length > 0) {
      return true;
    } else {
      return false;
    }
  };

  const getIsFirstNameValid = () => {
    return firstName.length > 0;
  };

  const getIsFormValid = () => {
    let valid =
      getIsFirstNameValid() &&
      getIsEmailValid() &&
      getIsPasswordValid() &&
      getisRoleValid();
    console.log("getIsEmailValid():", getIsEmailValid());
    console.log("getIsFirstNameValid():", getIsFirstNameValid());
    console.log("getIsPasswordValid():", getIsPasswordValid());
    console.log("getisRoleValid():", getisRoleValid());
    console.log("form is valid:", valid);
    return valid;
  };

  function handleEmailChange(e) {
    let valid = validateEmail(e.target.value);
    console.log("email valid:", valid);
    setEmail(e.target.value);
  }

  function handlePasswordChange(e) {
    setPassword({ value: e.target.value, isTouched: true });
    if (!getIsPasswordValid(e)) {
      return PasswordErrorMessage();
    }
  }

  const clearForm = () => {
    // Implement this function
    setPassword({ value: "", isTouched: false });
    setEmail("");
    setLastName("");
    setFirstName("");
    setRole("Role");
    console.log("role", role);
    console.log("password", password.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    clearForm();
    alert("Account created!");
  };

  let passwordWarning = getIsPasswordValid() ? "" : <PasswordErrorMessage />;

  // let passwordWarning = <PasswordErrorMessage />;
  return (
    <div className="App">
      <form onSubmit={handleSubmit}>
        <fieldset>
          <h2>Sign Up</h2>
          <div className="Field">
            <label>
              First name <sup>*</sup>
            </label>
            <input
              placeholder="First name"
              value={firstName}
              onChange={(e) => setFirstName(e.target.value)}
            />
          </div>
          <div className="Field">
            <label>Last name</label>
            <input
              placeholder="Last name"
              value={lastName}
              onChange={(e) => setLastName(e.target.value)}
            />
          </div>
          <div className="Field">
            <label>
              Email address <sup>*</sup>
            </label>
            <input
              placeholder="Email address"
              value={email}
              onChange={handleEmailChange}
            />
          </div>
          <div className="Field">
            <label>
              Password <sup>*</sup>
            </label>
            <input
              type={"password"}
              placeholder="Password"
              value={password.value}
              onChange={handlePasswordChange}
            />
            {passwordWarning}
          </div>
          <div className="Field">
            <label>
              Role <sup>*</sup>
            </label>
            <select onChange={(e) => setRole(e.target.value)} value={role}>
              <option value="role">Role</option>
              <option value="individual">Individual</option>
              <option value="business">Business</option>
            </select>
          </div>
          <button type="submit" disabled={!getIsFormValid()}>
            Create account
          </button>
        </fieldset>
      </form>
    </div>
  );
}

export default App;
```

### index.js

In the index.js file I've used the `createRoot` method to render the React app.

```jsx
import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import App from "./components/App";
import reportWebVitals from "./reportWebVitals";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
);
```

## References

- [My project source code is available here](https://github.com/LoganKells/meta-front-end-developer/tree/develop/course-6-advanced-react/lab-create-registration-form).
- [React docs - Forms](https://reactjs.org/docs/forms.html)
