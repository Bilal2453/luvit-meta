# Luvit-Meta

This project is a collection of definition files for the framework [Luvit](https://github.com/Luvit/Luvit). The definitions provide types for all modules currently shipped in Luvit, the classes, methods and their arguments and returns; it does as well provide descriptions whereever possible, either by scraping the Luvit-docs, Nodejs docs, luv docs or manually written in some places.

Some of the definitions are scraped off of code/docs and then some manual work is done to figure types out. For those the used scraper is located under [scrapers](/scrapers), the script outputs to a file in the same directory. From there it is manually copied over to the actual library definition.
Other definitions -and most of them- are completely manually written, as it was required to figure the logic out in order to figure the types.

### Cool, any examples?

Here are some samples of it working:

https://user-images.githubusercontent.com/38175840/169595790-80305ae3-c4fc-478a-af59-6bfa2acb2635.mp4


https://user-images.githubusercontent.com/38175840/169615756-f9946531-d943-4942-9124-f819783bc180.mp4


https://user-images.githubusercontent.com/38175840/169663522-5aed02c1-1308-49d6-8d63-3de23a872ef7.mp4


### Where does this work?

The definitions use the [Sumneko's Lua Language Server (LLS)](https://github.com/LuaLS/lua-language-server/) annotations, therefor it should work on any editor that support LLS, such as [VSCode](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) and Neovim.

### How to install it?

#### On Visual Studio Code:

  1. Install [this plugin](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) then reload editor.
  2. Open the workspace you want to enable this in.
  3. Press `Ctrl + Shift + P`, a prompt will open.
  4. Type "Open addon manager" and press enter.
  5. Search for `Luvit` then press `Enable`.
  6. The definitions should now be enabled for that workspace.
     Typing something like `local fs = require'fs'` will show you auto-completion.

![image](https://user-images.githubusercontent.com/38175840/222933683-fcf54e36-3b46-4ce0-b12a-3210e2c4f44e.png)


#### Manually, for other editors:

  1. Install [LLS]((https://github.com/LuaLS/lua-language-server/)) for your editor.
  2. Configure your meta directory.
  3. [Click here] to download the definitions; alternatively clone this repository.
  4. Extract the ZIP file to your meta directory/move the folder there.
  5. Should now be ready. If not, check the editor plugin's manual for doing this.

### What modules have definitions?

Built-in Modules:

- [x] buffer
- [x] childprocess
- [x] codec
- [x] core
- [x] dgram
- [x] dns
- [x] env
- [x] fs
- [x] helpful
- [x] hooks
- [x] http
- [x] http-codec
- [x] http-header
- [x] https
- [x] json
- [x] los
- [x] lpeg
- [x] net
- [x] path
- [x] pathjoin
- [x] pretty-print
- [x] process
- [x] querystring
- [x] re
- [x] readline
- [x] repl
- [x] require
- [x] resource
- [x] stream
- [x] thread
- [x] timer
- [x] tls
- [x] url
- [x] ustring
- [x] utils
- [x] uv
- [ ] miniz
- [ ] luvi
- [ ] rex
- [ ] openssl
- [ ] WinSVC

Popular libraries that are not built-in:

- [x] coro-http
- [ ] coro-net
- [ ] coro-channel
- [ ] coro-wrapper
- [ ] coro-fs
- [ ] coro-spawn

## License

This exhausting project is licensed under Apache License 2.0, see [LICENSE](/LICENSE) for more information. Feel free to fork and/or PR changes.
