# Luvit-Meta

This project is a collection of meta definitions for the platform [Luvit](https://github.com/Luvit/Luvit). The meta definitions provide typing for returns, parameters, constants and classes; It does as well provide documentation comments where possible, either by scraping the Luvit-docs, Nodejs docs, luv docs or manually written in some places.

Some of those definitions are scraped off of code/docs and then some manual work is done to figure types out. For those the used scraper is located under [scrapers](/scrapers), the scraper outputs to a file in the same directory. From there the output is manually copied over to the actual library definition.
Other defintions -and most of them- are completely manually written, I have not written a scraper for those mostly because the automated part is really not worth it. That is, the automated part would be a single copy-paste operation then delete anything between `function x()` and `end`. Something I prefer doing manually so I can actually catch some of the weird stuff.

### How does it work?

Here are some samples of it working:

[To Be Done]

### Where to expect this working?

Those metafiles where specifically generated to work with [Sumneko's Lua Language Server](https://github.com/sumneko/lua-language-server/), although it *may* work with other EmmyLua supported Language Servers. While the latter is not a goal of this project, minimum care was taken while writing the definitions.

### How to install it?

To install this into your language server, all you have to do is clone the git tree into the extension meta folder. In case of Sumneko's Language Server on VSCode, this will be `vscode/extensions/sumneko.lua-x-y-z/server/meta/3rd/Luvit`.

In steps, how to install it when using VScode, Sumneko's Language Server:

1. Open your terminal of choice up.
2. Execute `cd {PATH}`; where `{PATH}` is replaced with the `vscode/extensions/sumneko.lua-x-y-z/server/meta/3rd/` directory (the exact path will depend on your system).
3. Execute the following command: `git clone https://github.com/Bilal2453/luvit-sumneko-meta.git ./Luvit`.
4. You shall now see a new folder called `Luvit`, inside of it you shall see a `library` folder. This means the installation is done.

### How to use it?

It should automatically detect when you are using Luvit, and prompt you for using its definitions with something similar to the following:

![image](https://user-images.githubusercontent.com/38175840/169589684-c5770fc0-7026-4d13-b957-f776966b676d.png)

Although, if that does not happen, you can manually trigger it by typing `-- use-luvit` in a Lua file inside your VSCode workspace, save the file, then reload your workspace. It should now prompt you with something similar to the previous picture. Once you apply the settings, you can remove `-- use-luvit`.

### What modules have been completed and what not?

- [ ] buffer
- [ ] childprocess
- [x] codec
- [x] core
- [x] dgram
- [ ] dns
- [x] env
- [x] fs
- [x] helpful
- [x] hooks
- [x] http
- [x] http-codec
- [x] http-header
- [ ] https
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
- [ ] readline
- [ ] repl
- [x] require
- [ ] resources
- [x] stream
- [ ] thread
- [x] timer
- [ ] tls
- [x] url
- [x] ustring
- [x] utils
- [x] uv

### Why basic, table and string built-ins have been overwritten?

Since [Luvi](https://github.com/Luvit/Luvi)/[Luvit](https://github.com/Luvit/Luvit) come with Lua 5.2 compat (and even some Lua 5.3 stuff), the Language Server thinks they are not defined for the JIT environment giving away many annoying warnings. Thus I had to manually overwrite the built-in definitions and include the `JIT` version.

There is also [the difference between LuaJIT and Luvi](https://github.com/Luvit/Luvi#integration-with-cs-main-function) when it comes to `args` vs `arg`. The only way for me to tell the Language Server "hey, there is nothing such as `args`" is by overwriting the built-in definition.

## License

This exhausting project is licensed under Apache License 2.0, see [LICENSE](/LICENSE) for more information. Feel free to fork and/or PR changes.
