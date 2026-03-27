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
```

## Results
Best is to pass whole records into JS, sort them in there, and decode them back into records.
Limitation: these are very simple records. Maybe that advantage is winnowed away as the records get wider and deeper.


|                                                                       | runs / second | goodness of fit |
| --------------------------------------------------------------------- | ------------: | --------------: |
| Sort array of objects in JS and encode to/decode from records in Elm  |          1763 |          99.97% |
| Sort array of strings in JS, reconcile with records in Elm            |           949 |          99.99% |
| Sort array of records in Elm comparing in JS                          |           556 |          99.98% |

|                                                                       |   runs / second    |
| --------------------------------------------------------------------- | -----------------: |
| Sort array of objects in JS and encode to/decode from records in Elm  | ------------------ |
| Sort array of strings in JS, reconcile with records in Elm            |          --------- |
| Sort array of records in Elm comparing in JS                          |             ------ |
