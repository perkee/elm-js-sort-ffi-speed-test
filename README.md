# Speed test of two different approaches to JS FFI through decoders

## Background

I need to sort some records by a `String` field according to the user's locale, ideally without going through a whole update loop.

There are a few options for this. I am testing the speed of two different approaches that use Martin Janiczek's [pattern of creating a special getter and using paired encode/decode](https://gist.github.com/Janiczek/787f75e97cd0c00b5f74f73ce17f3e8a).

I wanted to know if it was faster to
- go through the JS/Elm interface once, sorting an array of strings with [`Intl.Collator`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Collator) that could then be used to sort the records, or 
- go through the JS/Elm interface on every comparison using [`String.prototype.localeCompare()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/localeCompare), creating a reusable comparison tool
- go through the JS/Elm interface once but pass the whole records and which field on them to sort on, and decode/encode them entirely

## Building

```bash
elm make src/Main.elm --output elm.js --optimize
# or with optimize-level-2
npm i # only upon cloning the repo
./node_modules/elm-optimize-level-2/bin/elm-optimize-level-2 -O3 src/Main.elm
```

## Results
Best is to pass whole records into JS, sort them in there, and decode them back into records.
Limitation: these are very simple records. Maybe that advantage is winnowed away as the records get wider and deeper.
Second best is to pass a list of `String`s to JS, sort that as an array, and reconcile your array of records. Particulars of composition vs lambdas are not consequential.
Worst is to sort in Elm by running a 


- Sort array of strings in JS, reconcile with records in Elm
  - Paranoid: return `Err` for impossible `Dict` misses: 999 runs/second
  - Permissive: put not found elements at end of sorted list
    - using composition: 993 runs/second
    - using lambdas: 1,011 runs/second
    - using composition, mapping decoder rather than result: 999 runs/second
- Sort array of records in Elm comparing in JS: 622 runs/second
- Sort array of objects in JS and encode to/decode from records in Elm: 1,803 runs/second
