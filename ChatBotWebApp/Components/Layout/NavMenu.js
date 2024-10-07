function getAllLocalStorageItems() {
    const items = { };  // Initialize an empty dictionary (object)

    for (let i = 0; i < localStorage.length; i++) {
            const key = localStorage.key(i);
    const value = localStorage.getItem(key);

    try {
                // Try parsing the value to see if it's a JSON array or object
                const parsedValue = JSON.parse(value);

    // If it's an array, keep it as is
    if (Array.isArray(parsedValue)) {
        items[key] = parsedValue;
                } else {
        // If it's not a list, wrap the parsed value in an array
        items[key] = [parsedValue];
                }
            } catch (e) {
        // If parsing fails (non-JSON), wrap the raw value in a lis
        items[key] = [value];
            }
        }
    console.log(items);
    return items;  // Return the dictionary with key-value pairs
    }
