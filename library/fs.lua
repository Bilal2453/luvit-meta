---@meta

---
---@class luvit.fs
local fs = {}

-- TODO: write type for ReadStream and WriteStream
-- TODO: new overload for each function that accepts either function or thread as its callback
-- TODO: new descriptions scraped from nodejs's fs module


---
---Close a file. No arguments other than a possible exception are given to the completion callback.
---
---@param fd integer
---@param callback? fun(err?: string) | thread
---@return uv_fs_t
function fs.close(fd, callback) end

---
---Synchronous file close
---
---@param fd integer
---@return boolean|nil success, string? err_name, string? err_msg
function fs.closeSync(fd) end

---@alias fs_open_flags
---Open file for reading.
---
---An exception occurs if the file does not exist.
---| 'r'
---Open file for reading and writing.
---
---An exception occurs if the file does not exist.
---| 'r+'
---Open file for reading in synchronous mode.
---Instructs the operating system to bypass the local file system cache.
---
---This is primarily useful for opening files on NFS mounts as it allows you to
---skip the potentially stale local cache. It has a very real impact on I/O
---performance so don't use this flag unless you need it.
---
---Note that this doesn't turn `fs.open()` (or what is accepting the flag) into a synchronous blocking call.
---If that's what you want then you should be using `fs.openSync()` (or the sync version of your call)
---| 'rs'
---Open file for reading and writing, telling the OS to open it synchronously.
---
---See notes for `'rs'` about using this with caution.
---| 'rs+'
---Open file for writing.
---
---The file is created (if it does not exist) or truncated (if it exists).
---| 'w'
---Open file for writing.
---
---Fails if the file exists.
---| 'wx'
---Open file for reading and writing.
---
---The file is created (if it does not exist) or truncated (if it exists).
---| 'w+'
---Open file for reading and writing.
---
---Fails if file exists.
---| 'wx+'
---Open file for appending.
---
---The file is created if it does not exist.
---| 'a'
---Open file for appending.
---
---Fails if the file exists.
---| 'ax'
---Open file for reading and appending.
---
---The file is created if it does not exist.
---| 'a+'
---Like `'a+'` but fails if `path` exists.
---| 'ax+'

---
---Asynchronous file open. `flags` can be:
---
---`mode` sets the file mode (permission and sticky bits), but only if the file was created.
--- It defaults to `0666`, readable and writeable.
---
---
---The exclusive flag `'x'` (`O_EXCL` flag in open(2)) ensures that `path` is newly
--- created. On POSIX systems, `path` is considered to exist even if it is a symlink
--- to a non-existent file. The exclusive flag may or may not work with network file
--- systems.
---
---On Linux, positional writes don't work when the file is opened in append mode.
--- The kernel ignores the position argument and always appends the data to
--- the end of the file.
---
---@param path string
---@param flags? fs_open_flags
---@param mode? integer
---@param callback? fun(err?: string, fd?: integer) | thread
---@return uv_fs_t
function fs.open(path, flags, mode, callback) end

---
---Synchronous version of `fs.open()`. Returns an integer representing the file
---descriptor.
---
---@param path string
---@param flags? fs_open_flags
---@param mode? integer
---@return integer|nil fd, string? err_name, string? err_msg
function fs.openSync(path, flags, mode) end

---
---Read data from the file specified by `fd`.
---
---`size` is an integer specifying the number of bytes to read. Defaults to 4096.
---
---`offset` is the offset in the buffer to start reading at.
---
---@param fd integer
---@param size? integer
---@param offset? integer
---@param callback? fun(err?: nil, data?: string) | thread
---@return uv_fs_t
function fs.read(fd, size, offset, callback) end

---
---Synchronous file read
---
---@param fd integer
---@param size? integer
---@param offset? integer
---@return string|nil data, string? err_name, string? err_msg
function fs.readSync(fd, size, offset) end

---
---Asynchronous delete file.
---
---@param path string
---@param callback? fun(err?: nil, success?: string) | thread
---@return uv_fs_t
function fs.unlink(path, callback) end

---
---Synchronous unlink.
---
---@param path string
---@return boolean|nil success, string? err_name, string? err_msg
function fs.unlinkSync(path) end

---
---Writes `data` to a file `fd` calling a function `callback` when done with amount of written bytes.
---`offset` is the offset in the buffer to start writing at.
---
---@param fd integer
---@param offset? integer
---@param data string|string[]
---@param callback? fun(err?: string, bytes?: integer) | thread
---@return uv_fs_t
function fs.write(fd, offset, data, callback) end

---
---Synchronous version of `fs.write` function
---
---@param fd integer
---@param offset? integer
---@param data string|string[]
---@return uv_fs_t
function fs.writeSync(fd, offset, data) end

---
---Creates a directory with name `path` and returns a callback with err or nil.
---Mode is the permissions set on the directory, defaults to octal 0777
---
---@param path string
---@param mode? integer
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.mkdir(path, mode, callback) end

---
---Sync version of mkdir.
---
---@param path string
---@param mode? integer
---@return boolean|nil success, string? err_name, string? err_msg
function fs.mkdirSync(path, mode) end

---
---
---@param path string
---@param mode integer
---@return boolean|nil success, string? err_msg
function fs.mkdirpSync(path, mode) end

---
---Makes a directory from a template object
---
---@param template string
---@param callback? fun(err: nil|string, path: string|nil) | thread
---@return uv_fs_t
function fs.mkdtemp(template, callback) end

---
---Sync version of mkdtemp
---
---@param template string
---@return string|nil path, string? err_name, string? err_msg
function fs.mkdtempSync(template) end

---
---Removes a directory
---
---@param path string
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.rmdir(path, callback) end

---
---Sync version of rmdir
---
---@param path string
---@return boolean|nil success, string? err_name, string? err_msg
function fs.rmdirSync(path) end

---
---Reads a directory, returning files and folders in it in the callback. First arg of cb is nil or err
---This function is not recursive. Use the luvit-walk package for a recursive variant
---
---@param path string
---@param callback? fun(err_obj?: luvit.core.Error, files?: string[]) | thread
function fs.readdir(path, callback) end

---
---Sync version of readdir. Will raise an exception on error.
---
---@param path string
---@return string[] files
function fs.readdirSync(path) end

---
---Similar to readdir but the callback here gets a function instead of a table containing
---the list of files. Every time this function is invoked it returns the name of the file/dir
---and the type of the file/dir (either file or directory).
---
---@param path string
---@param callback? fun(err?: string, iterator?: fun(): string, string) | thread
function fs.scandir(path, callback) end

---
---Simply returns the iterator function retrieved in the async scandirs callback.
---Do note, on error this will still return the iterator, which when called will raise the error.
---
---@param path string
---@return fun(): string, string iterator
function fs.scandirSync(path) end

---
---Checks if a file exists.
---
---@param path string
---@param callback? fun(err?: string, exists?: boolean) | thread
function fs.exists(path, callback) end

---
---Sync version of exists.
---Returns `boolean` whether the file exists or not, and if not, also returns `string` explaining why exactly the value is `false`.
---
---@param path string
---@return boolean exists, string? reason
function fs.existsSync(path) end

---
---```
---> fs.stat('/', function(err, stat) print(err) statData = stat end)
---uv_fs_t: 0x00ada5c0
---> nil
---statData
---{ mtime = { nsec = 0, sec = 1440200375 },
---atime = { nsec = 0, sec = 1444233226 }, ino = 2, nlink = 31, uid = 0,
---blksize = 4096, ctime = { nsec = 0, sec = 1440200375 }, rdev = 0,
---size = 1122, mode = 16877, type = 'directory',
---birthtime = { nsec = 0, sec = 1428616447 }, flags = 0, gid = 0, gen = 0,
---dev = 16777220, blocks = 0 }
---```
---
---@param path string
---@param callback? fun(err: nil|string, stat: fs_stat_struct|nil) | thread
---@return uv_fs_t
function fs.stat(path, callback) end

---
---Sync version of fs.stat. Returns either an error or the stat object
---
---@param path string
---@return fs_stat_struct|nil stat, string? err_name, string? err_msg
function fs.statSync(path) end

---
---Similar to stat but expects a file descriptor as retrieved from open or read instead of a path
---
---@param fd integer
---@param callback? fun(err: nil|string, stat: fs_stat_struct|nil) | thread
---@return uv_fs_t
function fs.fstat(fd, callback) end

---
---Sync fstat
---
---@param fd integer
---@return fs_stat_struct|nil stat, string? err_name, string? err_msg
function fs.fstatSync(fd) end

---
---lstat() is identical to stat(), except that if path is a symbolic link, then the link itself is stat-ed, not the file that it refers to.
---
---@param path string
---@param callback? fun(err: nil|string, stat: fs_stat_struct|nil) | thread
---@return uv_fs_t
function fs.lstat(path, callback) end

---
---Sync lstat
---
---@param path string
---@return fs_stat_struct|nil stat, string? err_name, string? err_msg
function fs.lstatSync(path) end

---
---Renames a file or directory located at the given path to the new path.
---The callback is called with either the error or true
---
---@param path string
---@param newPath string
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.rename(path, newPath, callback) end

---
---Sync version of rename
---
---@param path string
---@param newPath string
---@return boolean|nil success, string? err_name, string? err_msg
function fs.renameSync(path, newPath) end

---
---Async fsync. No arguments other than a possible exception are given to the completion callback.
---
---fsync() transfers ("flushes") all modified in-core data of (i.e., modified buffer cache pages for) the file referred to by the file descriptor fd to the disk device (or other permanent storage device) so that all changed information can be retrieved even after the system crashed or was rebooted. This includes writing through or flushing a disk cache if present. The call blocks until the device reports that the transfer has completed. It also flushes metadata information associated with the file (see stat(2)).
---
---Calling fsync() does not necessarily ensure that the entry in the directory containing the file has also reached disk. For that an explicit fsync() on a file descriptor for the directory is also needed.
---
---@param fd integer
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.fsync(fd, callback) end

---
---Sync version of fsync
---
---@param fd integer
---@return boolean|nil success, string? err_name, string? err_msg
function fs.fsyncSync(fd) end

---
---fdatasync() is similar to fsync(), but does not flush modified metadata unless that metadata is needed in order to allow a subsequent data retrieval to be correctly handled. For example, changes to st_atime or st_mtime (respectively, time of last access and time of last modification; see stat(2)) do not require flushing because they are not necessary for a subsequent data read to be handled correctly. On the other hand, a change to the file size (st_size, as made by say ftruncate(2)), would require a metadata flush.
---
---The aim of fdatasync() is to reduce disk activity for applications that do not require all metadata to be synchronized with the disk.
---
---@param fd integer
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.fdatasync(fd, callback) end

---
---Sync fdatasync
---
---@param fd integer
---@return boolean|nil success, string? err_name, string? err_msg
function fs.fdatasyncSync(fd) end

---
---Shrink or extend the size of each FILE to the specified size
---
---A FILE argument that does not exist is created.
---
---If a FILE is larger than the specified size, the extra data is lost. If a FILE is shorter, it is extended and the extended part (hole) reads as zero bytes.
---
---@param fd integer
---@param offset? integer
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.ftruncate(fd, offset, callback) end

---
---
---@param fname string # the file path
---@param offset integer
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.truncate(fname, offset, callback) end

---
---Sync truncate
---
---@param fd integer
---@param offset? integer
---@return boolean|nil success, string? err_name, string? err_msg
function fs.ftruncateSync(fd, offset) end

---
---
---@param fname string # the file path
---@param offset integer
---@return boolean|nil success, string? err_name
function fs.truncateSync(fname, offset) end

---
---Sync sendfile
---
---@param outFd integer
---@param inFd integer
---@param offset integer
---@param length integer
---@param callback? fun(err: nil|string, bytes: integer|nil) | thread
---@return uv_fs_t
function fs.sendfile(outFd, inFd, offset, length, callback) end

---
---Sync sendfile
---
---@param outFd integer
---@param inFd integer
---@param offset integer
---@param length integer
---@return integer|nil bytes, string? err_name, string? err_msg
function fs.sendfileSync(outFd, inFd, offset, length) end

---
---Tests a user's permissions for the file specified by path. mode is an optional integer that specifies the accessibility checks to be performed. The following constants define the possible values of mode. It is possible to create a mask consisting of the bitwise OR of two or more values.
---
---@param path string
---@param mode? fs_access_mode
---@param callback? fun(err: nil|string, permission: boolean|nil) | thread
---@return uv_fs_t
function fs.access(path, mode, callback) end

---
---
---@param path string
---@param mode? fs_access_mode
---@return boolean|nil permission, string? err_name, string? err_msg
function fs.accessSync(path, mode) end

---
---Asynchronous fchmod(2). No arguments other than a possible exception are given to the completion callback.
---
---@param path string
---@param mode integer
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.chmod(path, mode, callback) end

---
---Sync chmod.
---
---@param path string
---@param mode integer
---@return boolean|nil success, string? err_name, string? err_msg
function fs.chmodSync(path, mode) end

---
---Asynchronous fchmod(2). No arguments other than a possible exception are given to the completion callback.
---
---@param fd integer
---@param mode integer
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.fchmod(fd, mode, callback) end

---
---Sync fchmod
---
---@param fd integer
---@param mode integer
---@return boolean|nil success, string? err_name, string? err_msg
function fs.fchmodSync(fd, mode) end

---
---Async utime. Chages file last access and modification times
---
---@param path string
---@param atime number
---@param mtime number
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.utime(path, atime, mtime, callback) end

---
---Sync utime
---
---@param path string
---@param atime number
---@param mtime number
---@return boolean|nil success, string? err_name, string? err_msg
function fs.utimeSync(path, atime, mtime) end

---
---Changes file timestamps
---
---@param fd integer
---@param atime number
---@param mtime number
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.futime(fd, atime, mtime, callback) end

---
---Sync futime
---
---@param fd integer
---@param atime number
---@param mtime number
---@return boolean|nil success, string? err_name, string? err_msg
function fs.futimeSync(fd, atime, mtime) end

---
---link() creates a new link (also known as a hard link) to an existing file.
---If newpath exists it will not be overwritten.
---
---This new name may be used exactly as the old one for any operation; both names refer to the same file (and so have the same permissions and ownership) and it is impossible to tell which name was the "original".
---
---@param path string
---@param newPath string
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.link(path, newPath, callback) end

---
---Sync link
---
---@param path string
---@param newPath string
---@return boolean|nil success, string? err_name, string? err_msg
function fs.linkSync(path, newPath) end

---
---Creates soft link instead of a hard link as in link
---
---@param path string
---@param newPath string
---@param flags? {dir: boolean, junction: boolean}|integer
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.symlink(path, newPath, flags, callback) end

---
---Sync symlink
---
---@param path string
---@param newPath string
---@param flags? {dir: boolean, junction: boolean}|integer
---@return uv_fs_t
function fs.symlinkSync(path, newPath, flags) end

---
---Asynchronous readlink(2). The callback gets two arguments (err, linkString).
---Prints value of a symbolic link or canonical file name
---
---@param path string
---@param callback? fun(err: nil|string, path: string|nil) | thread
---@return uv_fs_t
function fs.readlink(path, callback) end

---
---Sync readlink
---
---@param path string
---@return string|nil path, string? err_name, string? err_msg
function fs.readlinkSync(path) end

---
---Async chown. Changes ownership of a file
---
---@param path string
---@param uid integer
---@param gid integer
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.chown(path, uid, gid, callback) end

---
---Sync chown
---
---@param path string
---@param uid integer
---@param gid integer
---@return boolean|nil success, string? err_name, string? err_msg
function fs.chownSync(path, uid, gid) end

---
---Like chown but works with file descriptors
---
---@param fd integer
---@param uid integer
---@param gid integer
---@param callback? fun(err: nil|string, success: boolean|nil) | thread
---@return uv_fs_t
function fs.fchown(fd, uid, gid, callback) end

---
---Sync fchown
---
---@param fd integer
---@param uid integer
---@param gid integer
---@return boolean|nil success, string? err_name, string? err_msg
function fs.fchownSync(fd, uid, gid) end

---
---Reads a file to a string buffer which is returned as the second argument in the callback. Works with virtual filesystems as well
---
---@param path string
---@param callback? fun(err?: string, chunk?: string) | thread
function fs.readFile(path, callback) end

---
---Sync readFile
---
---@param path string
---@return string|nil chunk, string? err_name
function fs.readFileSync(path) end

---
---Writes a file.
---
---@param path string
---@param data string|string[]
---@param callback? fun(err?: string) | thread
function fs.writeFile(path, data, callback) end

---
---Sync writeFile
---
---@param path string
---@param data string|string[]
---@return boolean success, string? err
function fs.writeFileSync(path, data) end

---
---Function which creates and returns a new read stream instance with the set options and path
---
---@param path string
---@param options unknown
---@return unknown
function fs.createReadStream(path, options) end

---
---Appends data to a file
---
---@param path string
---@param data string|string[]
---@param callback? fun(err?: string, bytes?: integer) | thread
function fs.appendFile(path, data, callback) end

---
---Sync version of append file.
---
---@param path string
---@param data string|string[]
---@return string? err_name
function fs.appendFileSync(path, data) end


return fs
