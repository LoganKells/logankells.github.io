# JavaScript Examples

*Last Updated: September 29, 2023*

This page contains code examples of JavaScript language features
I've used in my projects.

## Arrays

### Array.prototype.map()

The map method creates a new array populated with the results of the callback
function on every element in the calling array.

```javascript
const data = [
    {
        id: '1',
        title: 'Tiramisu',
        description: 'The best in town',
    },
    {
        id: '2',
        title: 'Lemon Ice Cream',
        description: 'Mind blowing taste',
    },
    {
        id: '3',
        title: 'Chocolate mousse',
        description: 'Unexplored flavours',
    },
]
const topDesserts = data.map((desert) => {
    return {content: `${desert.title} - ${desert.description}`}
})
console.log('topDesserts: ', topDesserts)

const desserts = [
    {
        title: 'Chocolate Cake',
        description: 'Chocolate cake is a cake flavored with melted chocolate',
        calories: 500,
    },
]

const newDesserts = desserts.map((dessert) => {
    return {
        title: dessert.title.toUpperCase(),
        ...dessert, // NOTE - this replaces the value of title in the object literal.
        kCal: dessert.calories / 1000,
    }
})
console.log('newDesserts: ', newDesserts)
```

### Array.prototype.sort()

The sort method sorts the elements of an array using a callback function,
in place, and returns the array.

```javascript
const desserts = [
    {
        name: 'Chocolate Cake',
        calories: 400,
        createdAt: '2022-09-01',
    },
    {
        name: 'Ice Cream',
        calories: 200,
        createdAt: '2022-01-02',
    },
    {
        name: 'Tiramisu',
        calories: 300,
        createdAt: '2021-10-03',
    },
    {
        name: 'Cheesecake',
        calories: 600,
        createdAt: '2022-01-04',
    },
]

// Sort by calories, low to high.
const dataList = desserts.sort(
    (itemA, itemB) => itemA.calories - itemB.calories
)
console.log(dataList)
```

### Array basics

Working with arrays in JavaScript using basics such as push, pop, shift, and forEach.

```javascript
// Working with Arrays

// ----------------
// Push and pop to array

var friendsList = ['Wayne', 'Sara', 'Frankie']
friendsList.push('Logan')
console.log(friendsList)
let last = friendsList.pop() // last element
console.log(friendsList, last)
const first = friendsList.shift() // first element
console.log(first, friendsList)

/*
Task:
    1. Create an empty array and store it in a variable named
       presentList.
    2. Push 5 items that you would like to receive as a gift.
    3. Use the pop method to delete all of the items
       (because you received all of the gifts!!)

    Extra: you could use a for loop to pop off all of the items.
    This might be a bit tricky, so I have given you a hint.
*/
function arrayUpdates() {
    let gifts = []
    gifts.push('gift1')
    gifts.push('gift1')
    gifts.push('gift1')
    gifts.push('gift1')
    gifts.push('gift1')
    console.log(`After pushing, gifts: ${gifts}`)
    while (gifts.length > 0) {
        gifts.pop()
    }
    console.log(`After popping, gifts: ${gifts}`)
}

arrayUpdates()

/*
 * Task: Use built in method to print items in an array
 * see: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods
 * */
function arrayForEach() {
    let data = [1, 2, 3, 4, 5]
    data.forEach((n, i) => {
        console.log(i, n)
    })
}

arrayForEach()
```

### References:

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort