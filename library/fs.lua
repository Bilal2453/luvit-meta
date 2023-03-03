---@meta
---@diagnostic disable: duplicate-set-field
-- TODO: new descriptions scraped from nodejs's fs module

---
---@class luvit.fs
local fs = {}

---@alias fs_mode string|integer



---
---Close a file. No arguments other than a possible exception are given to the completion callback.
---
---@param fd integer
---@param callback? fun(err?: string)
---@return uv_fs_t
function fs.close(fd, callback) end
---@param fd integer
---@param thread thread
---@return string? err
function fs.close(fd, thread) end

---
---Synchronous file close
---
---@param fd integer
---@return boolean|nil success, string? err_name, string? err_msg
function fs.closeSync(fd) end

---
---Asynchronous file open.
---
---`mode` sets the file mode (permission and sticky bits), but only if the file was created.
--- It defaults to `0666`, readable and writeable.
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
---@param flags? uv.aliases.fs_access_flags # Default `'r'`.
---@param mode? fs_mode # Default '0666'.
---@param callback? fun(err?: string, fd?: integer)
---@return uv_fs_t
function fs.open(path, flags, mode, callback) end
---@param path string
---@param flags? uv.aliases.fs_access_flags # Default `'r'`.
---@param mode? fs_mode # Default '0666'.
---@param thread thread
---@return string? err, integer? fd
---@nodiscard
function fs.open(path, flags, mode, thread) end
---@param path string
---@param callback fun(err?: string, fd?: integer)
---@return uv_fs_t
function fs.open(path, callback) end
---@param path string
---@param flags uv.aliases.fs_access_flags
---@param callback fun(err?: string, fd?: integer)
---@return uv_fs_t
function fs.open(path, flags, callback) end


---
---Synchronous version of `fs.open()`. Returns an integer representing the file
---descriptor.
---
---@param path string
---@param flags? uv.aliases.fs_access_flags # Default `'r'`.
---@param mode? string|integer # Default '0666'.
---@return integer|nil fd, string? err_name, string? err_msg
---@nodiscard
function fs.openSync(path, flags, mode) end

---
---Read data from the file specified by `fd`.
---
---`size` is an integer specifying the number of bytes to read. Defaults to 4096.
---
---`offset` is the offset in the buffer to start reading at.
---
---@param fd integer
---@param size? integer # Default `4096`.
---@param offset? integer # Default `-1`.
---@param callback? fun(err?: string, data?: string)
---@return uv_fs_t
function fs.read(fd, size, offset, callback) end
---@param fd integer
---@param size? integer # Default `4096`.
---@param offset? integer # Default `-1`.
---@param thread thread
---@return string? err, string? data
---@nodiscard
function fs.read(fd, size, offset, thread) end
---@param fd integer
---@param callback fun(err?: string, data?: string)
---@return uv_fs_t
function fs.read(fd, callback) end
---@param fd integer
---@param size integer
---@param callback fun(err?: string, data?: string)
---@return uv_fs_t
function fs.read(fd, size, callback) end

---
---Synchronous file read
---
---@param fd integer
---@param size? integer # Default `4096`.
---@param offset? integer # Default `-1`.
---@return string|nil data, string? err_name, string? err_msg
---@nodiscard
function fs.readSync(fd, size, offset) end

---
---Asynchronous delete file.
---
---@param path string
---@param callback? fun(err?: string, success?: string)
---@return uv_fs_t
function fs.unlink(path, callback) end
---@param path string
---@param thread thread
---@return string? err, string? success
---@nodiscard
function fs.unlink(path, thread) end

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
---@param offset? integer # Default '-1' (append).
---@param data string|string[]
---@param callback? fun(err?: string, bytes?: integer)
---@return uv_fs_t
function fs.write(fd, offset, data, callback) end
---@param fd integer
---@param offset? integer # Default '-1' (append).
---@param data string|string[]
---@param thread thread
---@return string? err, integer? bytes
---@nodiscard
function fs.write(fd, offset, data, thread) end
---@param fd integer
---@param callback fun(err?: string, bytes?: integer)
---@param data string|string[]
---@return uv_fs_t
function fs.write(fd, callback, data) end

---
---Synchronous version of `fs.write` function
---
---@param fd integer
---@param offset? integer # Default '-1-' (append).
---@param data string|string[]
---@return integer bytes
function fs.writeSync(fd, offset, data) end

---
---Creates a directory with name `path` and returns a callback with err or nil.
---Mode is the permissions set on the directory, defaults to octal 0777
---
---@param path string
---@param mode? string|integer # Default '0777'.
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.mkdir(path, mode, callback) end
---@param path string
---@param mode? string|integer # Default '0777'.
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.mkdir(path, mode, thread) end
---@param path string
---@param callback fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.mkdir(path, callback) end

---
---Sync version of mkdir.
---
---@param path string
---@param mode? string|integer # Default '0777'.
---@return boolean|nil success, string? err_name, string? err_msg
function fs.mkdirSync(path, mode) end

---
---
---@param path string
---@param mode? string|integer # Default '0777'.
---@return boolean|nil success, string? err_msg
function fs.mkdirpSync(path, mode) end

---
---Makes a directory from a template object
---
---@param template string
---@param callback? fun(err: nil|string, path: string|nil)
---@return uv_fs_t
function fs.mkdtemp(template, callback) end
---@param template string
---@param thread thread
---@return nil|string err, string|nil path
---@nodiscard
function fs.mkdtemp(template, thread) end

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
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.rmdir(path, callback) end
---@param path string
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.rmdir(path, thread) end

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
---@param callback? fun(err_obj?: luvit.core.Error, files?: string[])
function fs.readdir(path, callback) end
---@param path string
---@param thread thread
function fs.readdir(path, thread) end

---
---Sync version of readdir. Will raise an exception on error.
---
---@param path string
---@return string[] files
---@nodiscard
function fs.readdirSync(path) end

---@alias fs_scandir_iterator fun(): string, uv.aliases.fs_types)
---
---Similar to readdir but the callback here gets a function instead of a table containing
---the list of files. Every time this function is invoked it returns the name of the file/dir
---and the type of the file/dir (either file or directory).
---
---@param path string
---@param callback? fun(err?: string, iterator?: fs_scandir_iterator)
function fs.scandir(path, callback) end
---@param path string
---@param thread thread
function fs.scandir(path, thread) end

---
---Simply returns the iterator function retrieved in the async scandirs callback.
---Do note, on error this will still return the iterator, which when called will raise the error.
---
---@param path string
---@return fun(): string, uv.aliases.fs_types iterator
---@nodiscard
function fs.scandirSync(path) end

---
---Checks if a file exists.
---
---@param path string
---@param callback? fun(err?: string, exists?: boolean)
function fs.exists(path, callback) end
---@param path string
---@param thread thread
function fs.exists(path, thread) end

---
---Sync version of exists.
---Returns `boolean` whether the file exists or not, and if not, also returns `string` explaining why exactly the value is `false`.
---
---@param path string
---@return boolean exists, string? reason
---@nodiscard
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
---@param callback? fun(err: nil|string, stat: uv.aliases.fs_stat_table|nil)
---@return uv_fs_t
function fs.stat(path, callback) end
---@param path string
---@param thread thread
---@return nil|string err, uv.aliases.fs_stat_table|nil stat
---@nodiscard
function fs.stat(path, thread) end

---
---Sync version of fs.stat. Returns either an error or the stat object
---
---@param path string
---@return uv.aliases.fs_stat_table|nil stat, string? err_name, string? err_msg
---@nodiscard
function fs.statSync(path) end

---
---Similar to stat but expects a file descriptor as retrieved from open or read instead of a path
---
---@param fd integer
---@param callback? fun(err: nil|string, stat: uv.aliases.fs_stat_table|nil)
---@return uv_fs_t
function fs.fstat(fd, callback) end
---@param fd integer
---@param thread thread
---@return nil|string err, uv.aliases.fs_stat_table|nil stat
---@nodiscard
function fs.fstat(fd, thread) end

---
---Sync fstat
---
---@param fd integer
---@return uv.aliases.fs_stat_table|nil stat, string? err_name, string? err_msg
---@nodiscard
function fs.fstatSync(fd) end

---
---lstat() is identical to stat(), except that if path is a symbolic link, then the link itself is stat-ed, not the file that it refers to.
---
---@param path string
---@param callback? fun(err: nil|string, stat: uv.aliases.fs_stat_table|nil)
---@return uv_fs_t
function fs.lstat(path, callback) end
---@param path string
---@param thread thread
---@return nil|string err, uv.aliases.fs_stat_table|nil stat
---@nodiscard
function fs.lstat(path, thread) end

---
---Sync lstat
---
---@param path string
---@return uv.aliases.fs_stat_table|nil stat, string? err_name, string? err_msg
---@nodiscard
function fs.lstatSync(path) end

---
---Renames a file or directory located at the given path to the new path.
---The callback is called with either the error or true
---
---@param path string
---@param newPath string
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.rename(path, newPath, callback) end
---@param path string
---@param newPath string
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.rename(path, newPath, thread) end

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
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.fsync(fd, callback) end
---@param fd integer
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.fsync(fd, thread) end

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
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.fdatasync(fd, callback) end
---@param fd integer
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.fdatasync(fd, thread) end

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
---@param offset? integer # Default '0'.
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.ftruncate(fd, offset, callback) end
---@param fd integer
---@param offset? integer # Default '0'.
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.ftruncate(fd, offset, thread) end
---@param fd integer
---@param callback fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.ftruncate(fd, callback) end

---
---
---@param fname string # the file path
---@param offset? integer # Default `0`.
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.truncate(fname, offset, callback) end
---@param fname string # the file path
---@param offset? integer # Default `0`.
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.truncate(fname, offset, thread) end
---@param fname string # the file path
---@param callback fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.truncate(fname, callback) end

---
---Sync truncate
---
---@param fd integer
---@param offset? integer # Default '0'.
---@return boolean|nil success, string? err_name, string? err_msg
function fs.ftruncateSync(fd, offset) end

---
---
---@param fname string # the file path
---@param offset? integer # Default '0'.
---@return boolean|nil success, string? err_name
function fs.truncateSync(fname, offset) end

---
---Sync sendfile
---
---@param outFd integer
---@param inFd integer
---@param offset integer
---@param length integer
---@param callback? fun(err: nil|string, bytes: integer|nil)
---@return uv_fs_t
function fs.sendfile(outFd, inFd, offset, length, callback) end
---@param outFd integer
---@param inFd integer
---@param offset integer
---@param length integer
---@param thread thread
---@return string? err, integer? bytes
function fs.sendfile(outFd, inFd, offset, length, thread) end

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
---@param mode? uv.aliases.fs_access_mode
---@param callback? fun(err: nil|string, permission: boolean|nil)
---@return uv_fs_t
function fs.access(path, mode, callback) end
---@param path string
---@param mode? uv.aliases.fs_access_mode
---@param thread thread
---@return nil|string err, boolean|nil permission
---@nodiscard
function fs.access(path, mode, thread) end
---@param path string
---@param callback fun(err: nil|string, permission: boolean|nil)
---@return uv_fs_t
function fs.access(path, callback) end

---
---
---@param path string
---@param mode? uv.aliases.fs_access_mode
---@return boolean|nil permission, string? err_name, string? err_msg
function fs.accessSync(path, mode) end

---
---Asynchronous fchmod(2). No arguments other than a possible exception are given to the completion callback.
---
---@param path string
---@param mode? string|integer
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.chmod(path, mode, callback) end
---@param path string
---@param mode? string|integer
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.chmod(path, mode, thread) end

---
---Sync chmod.
---
---@param path string
---@param mode? string|integer
---@return boolean|nil success, string? err_name, string? err_msg
function fs.chmodSync(path, mode) end

---
---Asynchronous fchmod(2). No arguments other than a possible exception are given to the completion callback.
---
---@param fd integer
---@param mode? string|integer
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.fchmod(fd, mode, callback) end
---@param fd integer
---@param mode? string|integer
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.fchmod(fd, mode, thread) end

---
---Sync fchmod
---
---@param fd integer
---@param mode? string|integer
---@return boolean|nil success, string? err_name, string? err_msg
function fs.fchmodSync(fd, mode) end

---
---Async utime. Chages file last access and modification times
---
---@param path string
---@param atime number
---@param mtime number
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.utime(path, atime, mtime, callback) end
---@param path string
---@param atime number
---@param mtime number
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.utime(path, atime, mtime, thread) end

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
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.futime(fd, atime, mtime, callback) end
---@param fd integer
---@param atime number
---@param mtime number
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.futime(fd, atime, mtime, thread) end

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
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.link(path, newPath, callback) end
---@param path string
---@param newPath string
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.link(path, newPath, thread) end

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
---@param options? {dir: boolean, junction: boolean}|integer
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.symlink(path, newPath, options, callback) end
---@param path string
---@param newPath string
---@param options? {dir: boolean, junction: boolean}|integer
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.symlink(path, newPath, options, thread) end
---@param path string
---@param newPath string
---@param callback fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.symlink(path, newPath, callback) end

---
---Sync symlink
---
---@param path string
---@param newPath string
---@param options? {dir: boolean, junction: boolean}|integer
---@return boolean|nil, string?, string?
function fs.symlinkSync(path, newPath, options) end

---
---Asynchronous readlink(2). The callback gets two arguments (err, linkString).
---Prints value of a symbolic link or canonical file name
---
---@param path string
---@param callback? fun(err: nil|string, path: string|nil)
---@return uv_fs_t
function fs.readlink(path, callback) end
---@param path string
---@param thread thread
---@return nil|string err, string|nil path
---@nodiscard
function fs.readlink(path, thread) end

---
---Sync readlink
---
---@param path string
---@return string|nil path, string? err_name, string? err_msg
---@nodiscard
function fs.readlinkSync(path) end

---
---Async chown. Changes ownership of a file
---
---@param path string
---@param uid integer
---@param gid integer
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.chown(path, uid, gid, callback) end
---@param path string
---@param uid integer
---@param gid integer
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.chown(path, uid, gid, thread) end

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
---@param callback? fun(err: nil|string, success: boolean|nil)
---@return uv_fs_t
function fs.fchown(fd, uid, gid, callback) end
---@param fd integer
---@param uid integer
---@param gid integer
---@param thread thread
---@return nil|string err, boolean|nil success
---@nodiscard
function fs.fchown(fd, uid, gid, thread) end

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
---@param callback? fun(err?: string, chunk?: string)
function fs.readFile(path, callback) end
---@param path string
---@param thread thread
function fs.readFile(path, thread) end

---
---Sync readFile
---
---@param path string
---@return string|nil chunk, string? err_name
---@nodiscard
function fs.readFileSync(path) end

---
---Writes a file.
---
---@param path string
---@param data string|string[]
---@param callback? fun(err?: string)
function fs.writeFile(path, data, callback) end
---@param path string
---@param data string|string[]
---@param thread thread
function fs.writeFile(path, data, thread) end

---
---Sync writeFile
---
---@param path string
---@param data string|string[]
---@return boolean success, string? err
function fs.writeFileSync(path, data) end

---
---Appends data to a file
---
---@param path string
---@param data string|string[]
---@param callback? fun(err?: string, bytes?: integer)
function fs.appendFile(path, data, callback) end
---@param path string
---@param data string|string[]
---@param thread thread
---@return string? err, integer? bytes
function fs.appendFile(path, data, thread) end

---
---Sync version of append file.
---
---@param path string
---@param data string|string[]
---@return string? err_name
function fs.appendFileSync(path, data) end

---
---Function which creates and returns a new WriteStream instance with the set options and path
---
---@param path string
---@param options? WriteStream-Options
---@return luvit.fs.WriteStream
---@nodiscard
function fs.createWriteStream(path, options) end

---
---Function which creates and returns a new read stream instance with the set options and path
---
---@param path string
---@param options? ReadStream-Options
---@return luvit.fs.ReadStream
---@nodiscard
function fs.createReadStream(path, options) end



---@alias WriteStream-Options {fd?: integer, flags?: uv.aliases.fs_access_flags, mode?: integer, start?: integer}

---
---@class luvit.fs.WriteStream: luvit.stream.Writable
---@field options WriteStream-Options
---@field path string
---@field fd integer|nil
---@field pos integer|nil
---@field bytesWritten integer|0
local WriteStream = {}
fs.WriteStream = WriteStream

---
---Creates a new instance and initializes it.
---
---@param path string
---@param options? WriteStream-Options
---@return luvit.fs.WriteStream
---@nodiscard
function WriteStream:new(path, options) end

---
---@param callback? fun(err?: luvit.core.Error)
function WriteStream:open(callback) end

---
---@param data string|string[]
---@param callback? fun(err?: string, bytes?: integer)
function WriteStream:_write(data, callback) end

---
---
function WriteStream:close() end

---
---
function WriteStream:destroy() end


---
---@class luvit.fs.WriteStreamSync: luvit.fs.WriteStream
local WriteStreamSync = {}
fs.WriteStreamSync = WriteStreamSync
-- TODO: once we want to add descriptions, document the override fields of this



---@alias ReadStream-Options {fd?: integer, mode?: fs_mode|'0666', offset?: integer|nil, chunkSize?: integer|65536, length?: integer|nil}

---
---@class luvit.fs.ReadStream: luvit.stream.Readable
---@field fd integer|nil
---@field mode fs_mode|'0666'
---@field path string|nil
---@field offset integer|nil
---@field chunkSize integer|65536
---@field length integer|nil
---@field bytesRead integer
---@field reading nil
---@field flags 'r'
local ReadStream = {}
fs.ReadStream = ReadStream

---
---@param path string
---@param options? ReadStream-Options
---@return luvit.fs.ReadStream
---@nodiscard
function ReadStream:new(path, options) end

---
---@param callback? fun(err?: string)
function fs.ReadStream:open(callback) end

---
---@param n? integer # How many byte to read. Defaults to `options.chunkSize`.
function fs.ReadStream:_read(n) end

---
---
function fs.ReadStream:close() end

---
---@param err? any # If passed, emit `error` event and pass `err` as an argument to the listener.
function fs.ReadStream:destroy(err) end



return fs
