---@meta

---
---@class luvit.path.Path: luvit.core.Object
---The root path, on Posix this is `/`, on Windows this is `c:\`.
---@field root '/'|'C:\\'
---The path separator used by the platform.
---@field sep '/'|'\\'
local Path = {}

---
---Creates a new instance and initializes it.
---
---@param root string
---@param sep string
---@return luvit.path.Path
---@nodiscard
function Path:new(root, sep) end

---
---@private
---@param key string
---@return any
function Path:_get(key) end

---
---Gets the filesystems root path.
---
---On Posix platform, this always returns the string `/`.
---
---On Windows, if `filepath` is not specified, returns the default root `c:\`.
---If filepath is specified, returns one of the following:
--- - The UNC server and sharename in the format `"\\server\"` or `"\\server\share\"`.
--- - The drive letter in the format `"d:\"`.
--- - nil if the neither could be found (meaning the filepath is relative).
---
---@param filePath? string # Only respected on Windows.
---@return string? root
---@nodiscard
function Path.getRoot(filePath) end

---
---Gets the filesystems default path seperator.
---
---@return '\\'|'/' seperator
---@nodiscard
function Path.getSep() end

---
---Checks if path `a` is equal to `b`.
---
---@param a? string
---@param b? string
---@return boolean
---@nodiscard
function Path.pathsEqual(a, b) end

---
---Split a filename into [root, dir, basename].
---
---@protected
---@param filename string
---@return string root
---@return string dir
---@return string basename
---@nodiscard
function Path:_splitPath(filename) end

---
---Modifies an array of path parts in place by interpreting "." and ".." segments
---
---@protected
---@param parts string[]
---@param isrelative? boolean
function Path:_normalizeArray(parts, isrelative) end

---
---@protected
---@param filepath string
---@return string[]
---@nodiscard
function Path:_splitBySeparators(filepath) end

---
---The `path.normalize()` method normalizes the given path, resolving '..' and '.' segments.
---
---When multiple, sequential path segment separation characters are found (e.g. `/` on POSIX and either `\` or `/` on Windows),
---they are replaced by a single instance of the platform-specific path segment separator (`/` on POSIX and `\` on Windows).
---Trailing separators are preserved.
---
---If the path is a zero-length string, '.' is returned, representing the current working directory.
---
---For example, on POSIX:
---```lua
---path.normalize('/foo/bar//baz/asdf/quux/..') --> '/foo/bar/baz/asdf'
---```
---
---On Windows:
---```lua
---path.normalize('C:\\temp\\\\foo\\bar\\..\\') --> 'C:\\temp\\foo\\'
---```
---
---@param path string # The path to be normalized
---@return string normalized_path
---@nodiscard
function Path.normalize(path) end

---
---@protected
---@param parts string[]
---@return string[]
---@nodiscard
function Path:_filterparts(parts) end

---
---@protected
---@param parts string[]
---@return string
---@nodiscard
function Path:_rawjoin(parts) end

---
---@protected
---@param ...? string[]
---@return string joined
---@return string[] filtered_parts
---@nodiscard
function Path:_filteredjoin(...) end

---
---The `path.join()` method joins all given path segments together using the platform-specific separator as a delimiter, then normalizes the resulting path.
---
---Zero-length path segments are ignored. If the joined path string is a zero-length string then '.' will be returned, representing the current working directory.
---
---@param ...? string # A sequence of path segments
---@return string joined_path
---@nodiscard
function Path.join(...) end

---
---The `path.resolve()` method resolves a sequence of paths or path segments into an absolute path.
---
---The given sequence of paths is processed from right to left, with each subsequent path prepended until an absolute path is constructed.
---For instance, given the sequence of path segments: `/foo`, `/bar`, `baz`, calling `path.resolve('/foo', '/bar', 'baz')` would return `/bar/baz` because `'baz'` is not an absolute path but `'/bar' .. '/' .. 'baz'` is.
---
---If, after processing all given path segments, an absolute path has not yet been generated, the current working directory is used.
---
---The resulting path is normalized and trailing slashes are removed unless the path is resolved to the root directory.
---
---Zero-length path segments are ignored.
---
---If no path segments are passed, `path.resolve()` will return the absolute path of the current working directory.
---
---@param ...? string
---@return string resolved_path
---@nodiscard
function Path.resolve(...) end

---
---Returns the common parts of the given paths or `{}` if no common parts were found.
---
---@protected
---@param ...? string
---@return string[]
---@nodiscard
function Path:_commonParts(...) end

---
---The `path.relative()` method returns the relative path from from to to based on the current working directory.
---If from and to each resolve to the same path (after calling `path.resolve()` on each), a zero-length string is returned.
---
---If a zero-length string is passed as `from` or `to`, the current working directory will be used instead of the zero-length strings.
---
---For example, on POSIX:
---```lua
---path.relative('/data/orandea/test/aaa', '/data/orandea/impl/bbb') --> '../../impl/bbb'
---```
---
---On Windows:
---```lua
---path.relative('C:\\orandea\\test\\aaa', 'C:\\orandea\\impl\\bbb') --> Returns: '..\\..\\impl\\bbb'
---```
---
---@param from? string
---@param to? string
---@return string relative_path
---@nodiscard
function Path.relative(from, to) end

---
---The `path.dirname()` method returns the directory name of a path, similar to the Unix dirname command.
---Trailing directory separators are ignored.
---
---```lua
---path.dirname('/foo/bar/baz/asdf/quux') --> '/foo/bar/baz/asdf'
---```
---
---@param path string
---@return string dirname
---@nodiscard
function Path.dirname(path) end

---
---The `path.basename()` method returns the last portion of a path, similar to the Unix basename command.
---Trailing directory separators are ignored.
---
---```lua
---path.basename('/foo/bar/baz/asdf/quux.html') --> 'quux.html'
---
---path.basename('/foo/bar/baz/asdf/quux.html', '.html'); --> 'quux'
---```
---
---Although Windows usually treats file names, including file extensions, in a case-insensitive manner, this function does not.
---For example, `C:\\foo.html` and `C:\\foo.HTML` refer to the same file, but basename treats the extension as a case-sensitive string:
---
---```lua
---path.win32.basename('C:\\foo.html', '.html') --> 'foo'
---
---path.win32.basename('C:\\foo.HTML', '.html') --> 'foo.HTML'
---```
---
---@param path string
---@param ext? string # An optional file extension
---@return string basename
---@nodiscard
function Path.basename(path, ext) end

---
---The `path.extname()` method returns the extension of the path, from the last occurrence of the `.` (period) character to end of string in the last portion of the path.
---If there is no `.` in the last portion of the path, or if there are no `.` characters other than the first character of the basename of path (see `path.basename()`) , an empty string is returned.
---
---@param path string
---@return string extname
---@nodiscard
function Path.extname(path) end

---
---The `path.isAbsolute()` method determines if path is an absolute path.
---
---If the given path is a zero-length string, `false` will be returned.
---
---For example, on POSIX:
---```lua
---path.isAbsolute('/foo/bar') --> `true`
---path.isAbsolute('/baz/..')  --> `true`
---path.isAbsolute('qux/')     --> `false`
---path.isAbsolute('.')        --> `false`
---```
---
---On Windows:
---```lua
---path.isAbsolute('//server')    --> 'true'
---path.isAbsolute('\\\\server')  --> 'true'
---path.isAbsolute('C:/foo/..')   --> 'true'
---path.isAbsolute('C:\\foo\\..') --> 'true'
---path.isAbsolute('bar\\baz')    --> 'false'
---path.isAbsolute('bar/baz')     --> 'false'
---path.isAbsolute('.')           --> 'false'
---```
---
---@param path string
---@return boolean is_absolute
---@nodiscard
local function isAbsolute(path) end

---
---Checks if the path follows Microsofts universal naming convention.
---
---@param path? string
---@return boolean is_UNC
---@nodiscard
local function isUNC(path) end

---
---Drive-relative paths are unique to Windows and use the format `<letter>:filepath`.
---
---@param path? string
---@return boolean
---@nodiscard
local function isDriveRelative(path) end

---
---Replaces `/` with `\\` on Windows and vise versa on Posix.
---
---@param path? string
---@return string? normalized_path
---@nodiscard
local function normalizeSeparators(path) end

---
---@protected
---@param filepath string
---@return string
---@nodiscard
local function _makeLong(filepath) end

---
---@class luvit.path.PosixPath: luvit.path.Path
local PosixPath = {
	normalizeSeparators = normalizeSeparators,
	isDriveRelative = isDriveRelative,
	isAbsolute = isAbsolute,
	isUNC = isUNC,
}
---@protected
PosixPath._makeLong = _makeLong

---
---Creates a new instance and initializes it.
---
---@return luvit.path.PosixPath
---@nodiscard
function PosixPath:new() end

---
---@class luvit.path.WindowsPath: luvit.path.Path
local WindowsPath = {
	normalizeSeparators = normalizeSeparators,
	isDriveRelative = isDriveRelative,
	isAbsolute = isAbsolute,
	isUNC = isUNC,
}
---@protected
WindowsPath._makeLong = _makeLong

---
---Creates a new instance and initializes it.
---
---@return luvit.path.WindowsPath
---@nodiscard
function WindowsPath:new() end

---
---This module contains utilities for handling and transforming file paths.
---Almost all these methods perform only string transformations. The file system is not consulted to check whether paths are valid.
---Supports both windows and posix.
---
---Use `require('path')` to use this module.
---
---@class luvit.path: luvit.path.PosixPath, luvit.path.WindowsPath
---@field protected _internal {root: string, sep: string}
local path = {}

return path
