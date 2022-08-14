# MOROS Lisp

A minimalist Lisp interpreter is available in MOROS to extend the capabilities
of the Shell.

MOROS Lisp is a Lisp-1 dialect inspired by Scheme and Clojure.

It started from [Risp](https://github.com/stopachka/risp) and was extended to
include the seven primitive operators and the two special forms of John
McCarthy's paper "Recursive Functions of Symbolic Expressions and Their
Computation by Machine" (1960) and "The Roots of Lisp" (2002) by Paul Graham.

In version 0.2.0 the whole implementation was refactored and the parser was
rewritten to use [Nom](https://github.com/Geal/nom). This allowed the addition
of strings to the language and reading from the filesystem.

## Seven Primitive Operators
- `quote` (with the `'` syntax)
- `atom` (aliased to `atom?`)
- `eq` (aliased to `eq?`)
- `car` (aliased to `first`)
- `cdr` (aliased to `rest`)
- `cons`
- `cond`

## Two Special Forms
- `label` (aliased to `def`)
- `lambda` (aliased to `fn`)

## Additional Builtins
- `defun` (aliased to `defn`)
- `mapcar` (aliased to `map`)
- `type`
- `string`
- `encode-string` and `decode-string`
- `encode-float` and `decode-float`
- `parse`
- `system`
- `load`

- Arithmetic operations: `+`, `-`, `*`, `/`, `%`, `^`
- Trigonometric functions: `acos`, `asin`, `atan`, `cos`, `sin`, `tan`
- Comparisons: `>`, `<`, `>=`, `<=`, `=`
- Boolean operations: `and`, `or`
- String operations: `lines`, `join`, `cat`
- File IO: `read-file`, `read-file-bytes`, `write-file-bytes`, `append-file-bytes`

## Standard Library
- `/ini/lisp/core.lsp`

## Usage

The interpreter can be invoked from the shell:

```
> lisp
MOROS Lisp v0.1.0

> (+ 1 2)
3

> (quit)
```

And it can execute a file. For example a file located in `/tmp/lisp/fibonacci.lsp`
with the following content:

```lisp
(load "/ini/lisp/core.lsp")

(defn fib (n)
  (cond
    ((< n 2) n)
    (true (+ (fib (- n 1)) (fib (- n 2))))))

(println
  (cond
    ((null? args) "Usage: fibonacci <num>")
    (true (fib(parse (car args))))))
```

Would produce the following output:

```
> lisp /tmp/lisp/fibonacci.lsp 20
6755
```
