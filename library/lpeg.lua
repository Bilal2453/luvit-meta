---@meta

---@alias pattern lpeg-pattern|string|number|boolean|table|function

---
---LPeg is a new pattern-matching library for Lua, based on [Parsing Expression Grammars](http://pdos.csail.mit.edu/%7Ebaford/packrat/) (PEGs).
---
--- Following the Snobol tradition, LPeg defines patterns as first-class objects. That is, patterns are regular Lua values (represented by userdata). The library offers several functions to create and compose patterns. With the use of metamethods, several of these functions are provided as infix or prefix operators. On the one hand, the result is usually much more verbose than the typical encoding of patterns using the so called regular expressions (which typically are not regular expressions in the formal sense). On the other hand, first-class patterns allow much better documentation (as it is easy to comment the code, to break complex definitions in smaller parts, etc.) and are extensible, as we can define new functions to create and compose patterns.
---
---@class lpeglib
local lpeg = {}

--[[ LPeg methods ]]

---
---Returns a string with the running version of LPeg.
---
---@return string
---@nodiscard
function lpeg.version() end

---
---If the given value is a pattern, returns the string `"pattern"`. Otherwise returns nil.
---
---@param value any
---@return string|nil
---@nodiscard
function lpeg.type(value) end

---
---Sets a limit for the size of the backtrack stack used by LPeg to track calls and choices.
---(The default limit is 400.)
---
---Most well-written patterns need little backtrack levels and therefore you seldom need to change this limit;
---before changing it you should try to rewrite your pattern to avoid the need for extra space.
---
---Nevertheless, a few useful patterns may overflow.
---Also, with recursive grammars, subjects with deep recursion may also need larger limits.
---
---@param max number
function lpeg.setmaxstack(max) end

---
---The matching function. It attempts to match the given pattern against the subject string. If the match succeeds, returns the index in the subject of the first character after the match, or the [captured values](https://www.inf.puc-rio.br/~roberto/lpeg/#captures) (if the pattern captured any value).
---
---An optional numeric argument `init` makes the match start at that position in the subject string. As usual in Lua libraries, a negative value counts from the end.
---
---Unlike typical pattern-matching functions, `match` works only in anchored mode; that is, it tries to match the pattern with a prefix of the given subject string (at position `init`), not with an arbitrary substring of the subject. So, if we want to find a pattern anywhere in a string, we must either write a loop in Lua or write a pattern that matches anywhere. This second approach is easy and quite efficient; see [examples](https://www.inf.puc-rio.br/~roberto/lpeg/#ex).
---
---@param pattern pattern
---@param subject string
---@param init? number
---@return any|nil
---@nodiscard
function lpeg.match(pattern, subject, init) end

---
---Converts the given value into a proper pattern, according to the following rules:
---
--- - If the argument is a pattern, it is returned unmodified.
---
--- - If the argument is a string, it is translated to a pattern that matches the string literally.
---
--- - If the argument is a non-negative number *n*, the result is a pattern that matches exactly *n* characters.
---
--- - If the argument is a negative number *-n*, the result is a pattern that succeeds only-if the input string has less than *n* characters left: `lpeg.P(-n)` is equivalent to `-lpeg.P(n)` (see the [unary minus operation](https://www.inf.puc-rio.br/~roberto/lpeg/op-unm)).
---
--- - If the argument is a boolean, the result is a pattern that always succeeds or always fails (according to the boolean value), without consuming any input.
---
--- - If the argument is a table, it is interpreted as a grammar (see [Grammars](https://www.inf.puc-rio.br/~roberto/lpeg/#grammar)).
---
--- - If the argument is a function, returns a pattern equivalent to a [match-time capture](https://www.inf.puc-rio.br/~roberto/lpeg/#matchtime) over the empty string.
---
---@param value pattern
---@return lpeg-pattern
---@nodiscard
function lpeg.P(value) end

---
---Returns a pattern that matches only if the input string at the current position is preceded by `patt`. Pattern `patt` must match only strings with some fixed length, and it cannot contain captures.
---
---Like the [and predicate](https://www.inf.puc-rio.br/~roberto/lpeg/#op-len), this pattern never consumes any input, independently of success or failure.
---
---@param patt pattern
---@return lpeg-pattern
---@nodiscard
function lpeg.B(patt) end

---
---Returns a pattern that matches any single character belonging to one of the given *ranges*. Each `range` is a string *xy* of length 2, representing all characters with code between the codes of *x* and *y* (both inclusive).
---
---As an example, the pattern lpeg.R("09") matches any digit, and lpeg.R("az", "AZ") matches any ASCII letter.
---
---@param range? string
---@return lpeg-pattern
---@nodiscard
function lpeg.R(range) end

---
---Returns a pattern that matches any single character that appears in the given string. (The `S` stands for *Set*.)
---
---As an example, the pattern `lpeg.S("+-*/")` matches any arithmetic operator.
---
---Note that, if `s` is a character (that is, a string of length 1), then `lpeg.P(s)` is equivalent to `lpeg.S(s)` which is equivalent to `lpeg.R(s..s)`. Note also that both `lpeg.S("")` and `lpeg.R()` are patterns that always fail.
---
---@param string string
---@return lpeg-pattern
---@nodiscard
function lpeg.S(string) end

---
---This operation creates a non-terminal (a *variable*) for a grammar. The created non-terminal refers to the rule indexed by `v` in the enclosing grammar. (See [Grammars](https://www.inf.puc-rio.br/~roberto/lpeg/#grammar) for details.)
---
---@param v pattern
---@return lpeg-pattern
---@nodiscard
function lpeg.V(v) end

---
---Returns a table with patterns for matching some character classes according to the current locale. The table has fields named `alnum, alpha, cntrl, digit, graph, lower, print, punct, space, upper, xdigit`, each one containing a correspondent pattern. Each pattern matches any single character that belongs to its class.
---
---If called with an argument `table`, then it creates those fields inside the given table and returns that table.
---
---@param table? table
---@return {alnum: lpeg-pattern, cntrl: lpeg-pattern, digit: lpeg-pattern, graph: lpeg-pattern, lower: lpeg-pattern, print: lpeg-pattern, punct: lpeg-pattern, space: lpeg-pattern, upper: lpeg-pattern, xdigit: lpeg-pattern}
function lpeg.locale(table) end

---
---debug mode only.
---
---@param patt pattern
---@return unknown
function lpeg.ptree(patt) end

---
---debug mode only.
---
---@param patt lpeg-pattern
---@return unknown
function lpeg.pcode(patt) end

--[[ Capturing methods ]]

---
---Creates a *simple capture*, which captures the substring of the subject that matches `patt`. The captured value is a string. If `patt` has other captures, their values are returned after this one.
---
---@param patt pattern
---@return lpeg-pattern
---@nodiscard
function lpeg.C(patt) end

---
---Creates an *argument capture*. This pattern matches the empty string and produces the value given as the nth extra argument given in the call to `lpeg.match`.
---
---@param n number
---@return lpeg-pattern
---@nodiscard
function lpeg.Carg(n) end

---
---Creates a *back capture*. This pattern matches the empty string and produces the values produced by the *most recent* [group capture](https://www.inf.puc-rio.br/~roberto/lpeg/#cap-g) named `name` (where `name` can be any Lua value).
---
---*Most recent* means the last *complete outermost* group capture with the given name. A *Complete* capture means that the entire pattern corresponding to the capture has matched. An *Outermost* capture means that the capture is not inside another complete capture.
---
---In the same way that LPeg does not specify when it evaluates captures, it does not specify whether it reuses values previously produced by the group or re-evaluates them.
---
---@param name any
---@return lpeg-pattern
---@nodiscard
function lpeg.Cb(name) end

---
---Creates a *constant capture*. This pattern matches the empty string and produces all given values as its captured values.
---
---@param value? any
---@vararg any
---@return lpeg-pattern
---@nodiscard
function lpeg.Cc(value, ...) end

---
---Creates a *fold capture*. If `patt` produces a list of captures `C1 C2 ... Cn`, this capture will produce the value `func(...func(func(C1, C2), C3)..., Cn)`, that is, it will *fold* (or *accumulate*, or *reduce*) the captures from `patt` using function `func`.
---
---This capture assumes that `patt` should produce at least one capture with at least one value (of any type), which becomes the initial value of an *accumulator*. (If you need a specific initial value, you may prefix a [constant capture](https://www.inf.puc-rio.br/~roberto/lpeg/#cap-cc) to `patt`.) For each subsequent capture, LPeg calls `func` with this accumulator as the first argument and all values produced by the capture as extra arguments; the first result from this call becomes the new value for the accumulator. The final value of the accumulator becomes the captured value.
---
---As an example, the following pattern matches a list of numbers separated by commas and returns their addition:
---```lua
----- matches a numeral and captures its numerical value
---number = lpeg.R"09"^1 / tonumber
---
----- matches a list of numbers, capturing their values
---list = number * ("," * number)^0
---
----- auxiliary function to add two numbers
---function add (acc, newvalue) return acc + newvalue end
---
----- folds the list of numbers adding them
---sum = lpeg.Cf(list, add)
---
----- example of use
---print(sum:match("10,30,43"))   --> 83
---```
---
---@param patt pattern
---@param func function
---@return lpeg-pattern
---@nodiscard
function lpeg.Cf(patt, func) end

---
---Creates a *group capture*. It groups all values returned by `patt` into a single capture. The group may be anonymous (if no name is given) or named with the given name (which can be any non-nil Lua value).
---
---An anonymous group serves to join values from several captures into a single capture. A named group has a different behavior. In most situations, a named group returns no values at all. Its values are only relevant for a following [back capture](https://www.inf.puc-rio.br/~roberto/lpeg/#cap-b) or when used inside a [table capture](https://www.inf.puc-rio.br/~roberto/lpeg/#cap-t).
---
---@param patt pattern
---@param name? any
---@return lpeg-pattern
---@nodiscard
function lpeg.Cg(patt, name) end

---
---Creates a *position capture*. It matches the empty string and captures the position in the subject where the match occurs. The captured value is a number.
---
---@return lpeg-pattern
---@nodiscard
function lpeg.Cp() end

---
---Creates a *substitution capture*, which captures the substring of the subject that matches `patt`, with *substitutions*. For any capture inside `patt` with a value, the substring that matched the capture is replaced by the capture value (which should be a string). The final captured value is the string resulting from all replacements.
---
---@param patt pattern
---@return lpeg-pattern
---@nodiscard
function lpeg.Cs(patt) end

---
---Creates a table capture. This capture returns a table with all values from all anonymous captures made by `patt` inside this table in successive integer keys, starting at 1. Moreover, for each named capture group created by `patt`, the first value of the group is put into the table with the group name as its key. The captured value is only the table.
---
---@param patt pattern
---@return lpeg-pattern
---@nodiscard
function lpeg.Ct(patt) end

---
---Creates a match-time capture. Unlike all other captures, this one is evaluated immediately when a match occurs (even if it is part of a larger pattern that fails later). It forces the immediate evaluation of all its nested captures and then calls `func`.
---
---The given function gets as arguments the entire subject, the current position (after the match of `patt`), plus any capture values produced by `patt`.
---
---The first value returned by `func` defines how the match happens. If the call returns a number, the match succeeds and the returned number becomes the new current position. (Assuming a subject *s* and current position *i*, the returned number must be in the range *[i, len(s) + 1]*.) If the call returns **true**, the match succeeds without consuming any input. (So, to return **true** is equivalent to return *i*.) If the call returns **false, nil**, or no value, the match fails.
---
---Any extra values returned by the function become the values produced by the capture.
---
---@param patt pattern
---@param func function
---@return lpeg-pattern
---@nodiscard
function lpeg.Cmt(patt, func) end

---@class lpeg-pattern
local lpeg_pattern = {
  Cb = lpeg.Cb,
  Cp = lpeg.Cp,
  C = lpeg.C,
  V = lpeg.V,
  Carg = lpeg.Carg,
  P = lpeg.P,
  version = lpeg.version,
  R = lpeg.R,
  setmaxstack = lpeg.setmaxstack,
  S = lpeg.S,
  B = lpeg.B,
  Cc = lpeg.Cc,
  Cmt = lpeg.Cmt,
  locale = lpeg.locale,
  Cf = lpeg.Cf,
  Ct = lpeg.Ct,
  match = lpeg.match,
  pcode = lpeg.pcode,
  ptree = lpeg.ptree,
  Cs = lpeg.Cs,
  type = lpeg.type,
  Cg = lpeg.Cg,
}

---[[ Metatables methods ]]

---
---Returns a pattern that matches only if the input string matches `patt`, but without consuming any input, independently of success or failure. (This pattern is called an *and predicate* and it is equivalent to *&patt* in the original PEG notation.)
---
---This pattern never produces any capture.
---
---@param patt lpeg-pattern
---@return lpeg-pattern
function lpeg_pattern.__len(patt) end

---
---Returns a pattern that matches only if the input string does not match `patt`. It does not consume any input, independently of success or failure. (This pattern is equivalent to *!patt* in the original PEG notation.)
---
---As an example, the pattern `-lpeg.P(1)` matches only the end of string.
---
---This pattern never produces any captures, because either `patt` fails or `-patt` fails. (A failing pattern never produces captures.)
---
---@param patt lpeg-pattern
---@return lpeg-pattern
function lpeg_pattern.__unm(patt) end

---
---Returns a pattern equivalent to an *ordered choice* of `patt1` and `patt2`. (This is denoted by *patt1 / patt2* in the original PEG notation, not to be confused with the `/` operation in LPeg.) It matches either `patt1` or `patt2`, with no backtracking once one of them succeeds. The identity element for this operation is the pattern `lpeg.P(false)`, which always fails.
---
---If both `patt1` and `patt2` are character sets, this operation is equivalent to set union.
---
---```lua
---lower = lpeg.R("az")
---upper = lpeg.R("AZ")
---letter = lower + upper
---```
---
---@param patt lpeg-pattern
---@return lpeg-pattern
function lpeg_pattern.__add(patt) end

---
---Returns a pattern equivalent to *!patt2 patt1*. This pattern asserts that the input does not match `patt2` and then matches `patt1`.
---
---When successful, this pattern produces all captures from `patt1`. It never produces any capture from `patt2` (as either `patt2` fails or `patt1 - patt2` fails).
---
---If both `patt1` and `patt2` are character sets, this operation is equivalent to set difference. Note that `-patt` is equivalent to `"" - patt` (or `0 - patt`). If `patt` is a character set, `1 - patt` is its complement.
---
---@param patt lpeg-pattern
---@return lpeg-pattern
function lpeg_pattern.__sub(patt) end

---
---Returns a pattern that matches `patt1` and then matches `patt2`, starting where `patt1` finished. The identity element for this operation is the pattern `lpeg.P(true)`, which always succeeds.
---
---(LPeg uses the `*` operator [instead of the more obvious `..`] both because it has the right priority and because in formal languages it is common to use a dot for denoting concatenation.)
---
---@param patt lpeg-pattern
---@return lpeg-pattern
function lpeg_pattern.__mul(patt) end

---
---If `n` is nonnegative, this pattern is equivalent to *patt^n patt*: It matches `n` or more occurrences of `patt`.
---
---Otherwise, when `n` is negative, this pattern is equivalent to *(patt?)-n*: It matches at most `|n|` occurrences of `patt`.
---
---In particular, `patt^0` is equivalent to *patt**, `patt^1` is equivalent to *patt+*, and `patt^-1` is equivalent to *patt?* in the original PEG notation.
---
---In all cases, the resulting pattern is greedy with no backtracking (also called a *possessive* repetition). That is, it matches only the longest possible sequence of matches for `patt`.
---
---@param patt lpeg-pattern
---@return lpeg-pattern
function lpeg_pattern.__pow(patt) end

---
---Creates a capture of the relevant `subject` type.
---
--- - If `subject` is a string this creates a *string capture*. It creates a capture string based on `subject`. The captured value is a copy of the `subject`, except that the character % works as an escape character: any sequence in `subject` of the form `%`*n*, with *n* between 1 and 9, stands for the match of the *n*-th capture in `patt`. The sequence `%0` stands for the whole match. The sequence `%%` stands for a single `%`.
---
--- - If `subject` is a number this creates a *numbered capture*. For a non-zero number, the captured value is the n-th value captured by `patt`. When `number` is zero, there are no captured values.
---
--- - If `subject` is a table this creates a *query capture*. It indexes the given table using as key the first value captured by `patt`, or the whole match if `patt` produced no value. The value at that index is the final value of the capture. If the table does not have that key, there is no captured value.
---
--- - If `subject` is a function this creates a *function capture*. It calls the given function passing all captures made by `patt` as arguments, or the whole match if `patt` made no capture. The values returned by the function are the final values of the capture. In particular, if `function` returns no value, there is no captured value.
---
---@param patt lpeg-pattern
---@param subject string|number|table|function
function lpeg_pattern.__div(patt, subject) end

return lpeg
